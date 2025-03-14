<?php
session_start(); // Ajout de session_start()

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $mail = $_POST['mail'];
    $mdp = $_POST['mdp'];

    $errors = 0;
    $errors_flag = "";

    // Validation des champs
    if (empty($mail) || empty($mdp)) {
        $errors++;
       
        $_SESSION['notification_message'] = "Veuillez remplir tous les champs.";
        $_SESSION['notification_type'] = "error";
    }

    if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        $errors++;
        $_SESSION['notification_message'] = "Veuillez remplir un mail valide.";
        $_SESSION['notification_type'] = "error";
    }

    if ($errors === 0) {
        try {
            // 1. Rechercher dans la table enseignant
            $stmt = $pdo->prepare("SELECT idEnseignant, mdpEnseignant, autorisationAdmin FROM enseignant WHERE mailEnseignant = :mail");
            $stmt->execute([':mail' => $mail]);
            $enseignant = $stmt->fetch(PDO::FETCH_ASSOC);

            // 2. Si pas trouvé dans enseignant, rechercher dans étudiant
            if (!$enseignant) {
                $stmt = $pdo->prepare("SELECT idCompteEtudiant, prenomEtudiant, nomEtudiant, mdpEtudiant, groupeEtudiant, anneePromotion FROM compte_etudiant WHERE mailEtudiant = :mail");
                $stmt->execute([':mail' => $mail]);
                $etudiant = $stmt->fetch(PDO::FETCH_ASSOC);
            }

            // 3. Vérifier les résultats et connecter l'utilisateur
            if ($enseignant && password_verify($mdp, $enseignant['mdpEnseignant'])) {
                // Connexion en tant qu'enseignant
                $_SESSION['user_id'] = $enseignant['idEnseignant'];
                $_SESSION['is_admin'] = $enseignant['autorisationAdmin'];
                $_SESSION['role'] = 'enseignant';
                $redirectPage = 'index.php'; // Remplacez par la page de redirection appropriée
            } elseif ($etudiant && password_verify($mdp, $etudiant['mdpEtudiant'])) {
                // Connexion en tant qu'étudiant
                $_SESSION['user_id'] = $etudiant['idCompteEtudiant'];
                $_SESSION['role'] = 'etudiant';
                $_SESSION['nom'] = $etudiant['nomEtudiant'];
                $_SESSION['prenom'] = $etudiant["prenomEtudiant"];
                $_SESSION['groupeEtudiant'] = $etudiant["groupeEtudiant"];
                $_SESSION['anneePromotion'] = $etudiant["anneePromotion"];
                $redirectPage = 'index.php'; // Remplacez par la page de redirection appropriée
            } else {
                $errors++;
                $_SESSION['notification_message'] = "Adresse email / mot de passe incorrect.";
                $_SESSION['notification_type'] = "error";
            }

            // 4. Redirection (si connexion réussie)
            if (isset($redirectPage)) {
                header("Location: " . $redirectPage);
                exit();
            }
        } catch (PDOException $e) {
            // Gestion des erreurs de la base de données
            $errors++;
            $_SESSION['notification_message'] = "Erreur lors de la connexion : " . $e->getMessage() . "<br>";
            $_SESSION['notification_type'] = "error";
        }
    }

}
?>
