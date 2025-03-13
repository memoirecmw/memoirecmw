<?php
session_start();

// Assurez-vous que $pdo est correctement initialisé et connecté à votre base de données

// Récupérer l'idCatégorieRendu
$requete = $pdo->prepare("SELECT idCategorieRendu FROM categorie_rendu WHERE titreCategorieRendu = ?");
if (!$requete) {
    die("Erreur de préparation de la requête idCategorieRendu : " . print_r($pdo->errorInfo(), true));
}
$requete->execute([$currentPage]);
$resultat = $requete->fetch(PDO::FETCH_ASSOC);

if ($resultat) {
    $idCategorieRendu = $resultat['idCategorieRendu'];
} else {
    echo "Erreur: Catégorie de rendu non trouvée pour cette page.";
    exit();
}

// Fonctions pour nettoyer les noms de fichiers
function nettoyerPrenomFichier($prenom) {
    $prenomNormalise = iconv('UTF-8', 'ASCII//TRANSLIT', $prenom);
    $prenomNettoye = preg_replace('/[^a-zA-Z0-9]/', '', $prenomNormalise);
    return strtolower($prenomNettoye);
}

function nettoyerNomFichier($nom) {
    $nomNormalise = iconv('UTF-8', 'ASCII//TRANSLIT', $nom);
    $nomNettoye = preg_replace('/[^a-zA-Z0-9]/', '', $nomNormalise);
    return strtoupper($nomNettoye);
}

// Récupérer le dernier fichier rendu (si existant)
$requete_rendu_existant = $pdo->prepare("SELECT lienRendu, dateRendu FROM rendu WHERE idCompteEtudiant = ? AND idCategorieRendu = ? ORDER BY dateRendu DESC LIMIT 1");
$requete_rendu_existant->execute([$_SESSION['user_id'], $idCategorieRendu]);
$resultat_rendu_existant = $requete_rendu_existant->fetch(PDO::FETCH_ASSOC);

$fichier_rendu_existant = $resultat_rendu_existant ? basename($resultat_rendu_existant['lienRendu']) : null;
$date_rendu_existant = $resultat_rendu_existant ? $resultat_rendu_existant['dateRendu'] : null;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_FILES['fichier'])) {
        $fichier = $_FILES['fichier'];
        $sujet = $_POST['sujet']; // Récupération du sujet

        // Récupérer la date du jour
        $aujourdhui = date("Ymd");

        $nomFichier = $currentPage . nettoyerNomFichier($_SESSION["nom"]) . nettoyerPrenomFichier($_SESSION["prenom"]) . $aujourdhui;

        // Vérification du fichier
        if ($fichier['error'] == UPLOAD_ERR_OK) {
            $type_autorises = ['application/pdf'];
            if (in_array($fichier['type'], $type_autorises)) {
                $cheminDestination = 'includes/upload/' . $currentPage . "/" . $nomFichier . ".pdf";

                if (move_uploaded_file($fichier['tmp_name'], $cheminDestination)) {
                    // Enregistrement du sujet dans la table sujet
                    $requete2 = $pdo->prepare("INSERT INTO sujet (titreSujet, dateSujet, idCompteEtudiant) VALUES (?, NOW(), ?)");
                    $resultat_insertion2 = $requete2->execute([$sujet, $_SESSION['user_id']]);

                    if ($resultat_insertion2) {
                        // Récupération de l'idSujet généré
                        $idSujet = $pdo->lastInsertId();

                        // Enregistrement dans la base de données avec l'idSujet
                        $requete = $pdo->prepare("INSERT INTO rendu (nomRendu, dateRendu, lienRendu, idCompteEtudiant, idCategorieRendu, idSujet) VALUES (?, NOW(), ?, ?, ?, ?)");
                        $resultat_insertion = $requete->execute([$nomFichier, $cheminDestination, $_SESSION['user_id'], $idCategorieRendu, $idSujet]);

                        if ($resultat_insertion) {
                            $_SESSION['notification_message'] = "Le fichier et le sujet ont été téléchargés et enregistrés avec succès.";
                            $_SESSION['notification_type'] = "success";
                        } else {
                            $_SESSION['notification_message'] = "Erreur lors de l'enregistrement du fichier : " . print_r($requete->errorInfo(), true);
                            $_SESSION['notification_type'] = "error";
                        }
                    } else {
                        $_SESSION['notification_message'] = "Erreur lors de l'enregistrement du sujet : " . print_r($requete2->errorInfo(), true);
                        $_SESSION['notification_type'] = "error";
                    }
                } else {
                    $_SESSION['notification_message'] = "Erreur lors du déplacement du fichier.";
                    $_SESSION['notification_type'] = "error";
                }
            } else {
                $_SESSION['notification_message'] = "Type de fichier non autorisé.";
                $_SESSION['notification_type'] = "error";
            }
        } else {
            $_SESSION['notification_message'] = "Erreur lors du téléchargement du fichier : " . $fichier['error'];
            $_SESSION['notification_type'] = "error";
        }
    }
    header("Location: " . $_SERVER['PHP_SELF']); // Redirection pour éviter le renvoi du formulaire
    exit();
}
?>

<script>
    <?php if (isset($_SESSION['notification_message'])) : ?>
    showNotification("<?php echo $_SESSION['notification_message']; ?>", "<?php echo $_SESSION['notification_type']; ?>");
    <?php unset($_SESSION['notification_message']); unset($_SESSION['notification_type']); ?>
    <?php endif; ?>
</script>
<form id="formRendu" class="main-content " action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
    <div class="rendu-container">
        <div class="upload-area" id="drop-area">
            <label for="fichier" class="upload-label">
                <i class="fas fa-download"></i>
            </label>
            <input type="file" name="fichier" id="fichier" class="upload-input">
            <div id="file-name"></div>
            <div id="file-preview"></div>
        </div>
        <div class="rendu-info">
            <p>Si tu as déjà importé un fichier pour ce rendu, ils seront automatiquement en <dessous></dessous> rangé si tu en importes un nouveau.</p>
            <input type="text" name="sujet" placeholder="Sujet" class="sujet-input" required>
            <p>
                Fichiers déjà rendus :
                <?php if ($fichier_rendu_existant) : ?>
                    <a href="<?php echo $resultat_rendu_existant['lienRendu']; ?>" target="_blank">
                        <span id="fichierRendu"><?php echo htmlspecialchars($fichier_rendu_existant); ?></span>
                    </a>
                    (Publié le <?php echo date('d/m/Y', strtotime($date_rendu_existant)); ?>)
                <?php else : ?>
                    <span id="fichierRendu">Aucun fichier rendu</span>
                <?php endif; ?>
            </p>
            <input type="submit" value="Envoyer" class="submit-button">
        </div>
    </div>
</form>