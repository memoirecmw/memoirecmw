<?php
if (empty($_POST)) {
} else {
    $mailEtudiant = $_POST['mailEtudiant'];
    $nomEtudiant = $_POST['nomEtudiant'];
    $prenomEtudiant = $_POST['prenomEtudiant'];
    $groupeEtudiant = $_POST['groupeEtudiant'];
    $mdpEtudiant = $_POST['mdpEtudiant'];
    $cmdpEtudiant = $_POST['cmdpEtudiant'];

    //Compteur d'erreurs
    $errors = 0;
    $notification_message = "";

    // présence du @
    if (!filter_var($mailEtudiant, FILTER_VALIDATE_EMAIL)) {
        $errors++;
        $notification_message .= "<br>Veuillez entrer une adresse email valide (ex: exemple@domaine.com).<br>";
    }

    // Vérification de l'unicité du mail dans la BDD
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM compte_etudiant WHERE mailEtudiant = :mailEtudiant");
    $stmt->execute([':mailEtudiant' => $mailEtudiant]);
    $mailExists = $stmt->fetchColumn() > 0;

    if ($mailExists) {
        $errors += 1;
        $notification_message .= "<br>Le mail '$mailEtudiant' existe déjà dans la base de données. <br>";
        $notification_type = "error";
    }

    //vérifie alphabétique
    if (!ctype_alpha($nomEtudiant)) {
        $errors++;
        $notification_message .= "<br>Veuillez entrer un nom conforme (alphabétique).<br>";
        $notification_type = "error";
    }

    //vérifie en REGEX caractères spéciaux pour prénom
    if (!preg_match('/^[a-zA-ZÀ-ÿ\s-]+$/u', $prenomEtudiant)) {
        $errors++;
        $notification_message .= "<br>Veuillez entrer un prénom sans caractères spéciaux (accents et tirets autorisés).<br>";
        $notification_type = "error";
    }
    //Condition mdp < 8
    if (strlen($mdpEtudiant) < 8) {
        $errors++;
        $notification_message .= "<br>Veuillez entrer un mot de passe avec un minimum de 8 caractères.<br>";
        $notification_type = "error";
    }

    //Confirmation du mdp 2 x
    if ($mdpEtudiant !== $cmdpEtudiant) {
        $errors++;
        $notification_message .= "<br>Les deux mots de passe ne correspondent pas.<br>";
        $notification_type = "error";
    }
    if ($errors > 0) {
        // Affichage des erreurs rencontrées
       // echo "<div style='color:red'>" . $notification_message . "</div>";
    }

    // SI TOUT EST BON, CA SE PASSE ICI-è
    else {

        // Association d'un tableau pour faciliter le travail
        $formData = [
            "nomEtudiant" => $nomEtudiant,
            "prenomEtudiant" => $prenomEtudiant,
            "mailEtudiant" => $mailEtudiant,
            "mdpEtudiant" => $mdpEtudiant
        ];
        try {
            $pdo->beginTransaction(); // Start the transaction
            // Cryptage du MDP
            $hashedPassword = password_hash($formData['mdpEtudiant'], PASSWORD_DEFAULT);
            // Insertion BDD des champs dans la table compte étudiant
            $stmt = $pdo->prepare("INSERT INTO compte_etudiant (nomEtudiant, prenomEtudiant, mailEtudiant, mdpEtudiant, anneePromotion, actif, groupeEtudiant) 
                           VALUES (:nomEtudiant, :prenomEtudiant, :mailEtudiant, :mdpEtudiant, YEAR(CURDATE()) + 1, TRUE, :groupeEtudiant)");
            if (!$stmt->execute([
                ":nomEtudiant" => $formData['nomEtudiant'],
                ":prenomEtudiant" => $formData['prenomEtudiant'],
                ":mailEtudiant" => $formData['mailEtudiant'],
                ":mdpEtudiant" => $hashedPassword,
                ":groupeEtudiant" => $groupeEtudiant
    
            ])) {
                throw new Exception("Erreur lors de l'insertion dans compte_etudiant : " . implode(" ", $stmt->errorInfo()));
            }

            $idCompteEtudiant = $pdo->lastInsertId(); // Get the ID of the newly inserted compte_etudiant

            $pdo->commit(); // Commit the transaction
            $notification_message = "Connecté.e sur votre espace";
            $notification_type = "success";

        } catch (PDOException $e) {
            $pdo->rollBack(); // Rollback the transaction on error
            echo "Registration error: " . $e->getMessage();
        } catch (Exception $e) {
            $pdo->rollBack(); // Rollback the transaction on error
            echo $e->getMessage();
        }
    }
}