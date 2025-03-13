<?php
if (empty($_POST)) {
} else {
    $mailEnseignant = $_POST['mailEnseignant'];
    $nomEnseignant = $_POST['nomEnseignant'];
    $prenomEnseignant = $_POST['prenomEnseignant'];
    $mdpEnseignant = $_POST['mdpEnseignant'];
    $cmdpEnseignant = $_POST['cmdpEnseignant'];

    //Compteur d'erreurs
    $errors = 0;
    $errors_flag = "";

    // présence du @
    if (!filter_var($mailEnseignant, FILTER_VALIDATE_EMAIL)) {
        $errors++;
        $errors_flag .= "<br>Veuillez entrer une adresse email valide (ex: exemple@domaine.com).<br>";
    }

    // Vérification de l'unicité du mail dans la BDD
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM enseignant WHERE mailEnseignant = :mailEnseignant");
    $stmt->execute([':mailEnseignant' => $mailEnseignant]);
    $mailExists = $stmt->fetchColumn() > 0;

    if ($mailExists) {
        $errors += 1;
        $errors_flag .= "<br>Le mail '$mailEnseignant' existe déjà dans la base de données. <br>";
    }

    //vérifie alphabétique
    if (!ctype_alpha($nomEnseignant)) {
        $errors++;
        $errors_flag .= "<br>Veuillez entrer un nom conforme (alphabétique).<br>";
    }

    //vérifie en REGEX caractères spéciaux pour prénom
    if (!preg_match('/^[a-zA-ZÀ-ÿ\s-]+$/u', $prenomEnseignant)) {
        $errors++;
        $errors_flag .= "<br>Veuillez entrer un prénom sans caractères spéciaux (accents et tirets autorisés).<br>";
    }
    //Condition mdp < 8
    if (strlen($mdpEnseignant) < 8) {
        $errors++;
        $errors_flag .= "<br>Veuillez entrer un mot de passe avec un minimum de 8 caractères.<br>";
    }

    //Confirmation du mdp 2 x
    if ($mdpEnseignant !== $cmdpEnseignant) {
        $errors++;
        $errors_flag .= "<br>Les deux mots de passe ne correspondent pas.<br>";
    }
    if ($errors > 0) {
        // Affichage des erreurs rencontrées
       // echo "<div style='color:red'>" . $errors_flag . "</div>";
    }

    // SI TOUT EST BON, CA SE PASSE ICI
    else {

        // Association d'un tableau pour faciliter le travail
        $formData = [
            "nomEnseignant" => $nomEnseignant,
            "prenomEnseignant" => $prenomEnseignant,
            "mailEnseignant" => $mailEnseignant,
            "mdpEnseignant" => $mdpEnseignant
        ];
        try {
            $pdo->beginTransaction(); // Start the transaction
            // Cryptage du MDP
            $hashedPassword = password_hash($formData['mdpEnseignant'], PASSWORD_DEFAULT);
            // Insertion BDD des champs dans la table compte étudiant
            $stmt = $pdo->prepare("INSERT INTO enseignant (nomEnseignant, prenomEnseignant, mailEnseignant, mdpEnseignant, autorisationAdmin) 
                           VALUES (:nomEnseignant, :prenomEnseignant, :mailEnseignant, :mdpEnseignant, TRUE)");
            if (!$stmt->execute([
                ":nomEnseignant" => $formData['nomEnseignant'],
                ":prenomEnseignant" => $formData['prenomEnseignant'],
                ":mailEnseignant" => $formData['mailEnseignant'],
                ":mdpEnseignant" => $hashedPassword

            ])) {
                throw new Exception("Erreur lors de l'insertion dans enseignant : " . implode(" ", $stmt->errorInfo()));
            }

            $idCompteEnseignant = $pdo->lastInsertId(); // Get the ID of the newly inserted compte_etudiant

            $pdo->commit(); // Commit the transaction
           // echo "Registration successful.";

        } catch (PDOException $e) {
            $pdo->rollBack(); // Rollback the transaction on error
            echo "Registration error: " . $e->getMessage();
        } catch (Exception $e) {
            $pdo->rollBack(); // Rollback the transaction on error
            echo $e->getMessage();
        }
    }
}