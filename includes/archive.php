<?php
// Récupérer l'ID de la catégorie de rendu (assurez-vous qu'il est défini)
if (isset($idCategorieRendu)) {
    // Récupérer le titre de la catégorie de rendu
    $requeteTitre = $pdo->prepare("SELECT titreCategorieRendu FROM categorie_rendu WHERE idCategorieRendu = ?");
    $requeteTitre->execute([$idCategorieRendu]);
    $resultatTitre = $requeteTitre->fetch(PDO::FETCH_ASSOC);
    $titreCategorieRendu = $resultatTitre['titreCategorieRendu'];

    // Récupérer l'année actuelle
    $anneeActuelle = date('Y');

    // Générer les années pour le filtre
    $annees = range($anneeActuelle, $anneeActuelle - 1);

    // Récupérer l'année sélectionnée (par défaut, l'année actuelle)
    $anneeSelectionnee = isset($_GET['annee']) ? $_GET['annee'] : $anneeActuelle;

    // Requête SQL pour récupérer les rendus par ID de catégorie de rendu et par année
$requete = $pdo->prepare("SELECT c.prenomEtudiant, c.nomEtudiant, s.titreSujet, r.lienRendu, r.dateRendu
FROM rendu r
JOIN compte_etudiant c ON r.idCompteEtudiant = c.idCompteEtudiant
JOIN sujet s ON r.idSujet = s.idSujet
WHERE r.idCategorieRendu = ? AND YEAR(r.dateRendu) = ?
ORDER BY c.nomEtudiant ASC, r.dateRendu DESC;"); // Tri par date décroissante
    $requete->execute([$idCategorieRendu, $anneeSelectionnee]);
    $rendus = $requete->fetchAll(PDO::FETCH_ASSOC);
    // Afficher le titre de la catégorie de rendu
    ?>
        <div class="archive-cont">
    <div class='titreArchive'>Rendus des étudiants : </div>
 <div class="filtre-annees">
        <?php foreach ($annees as $annee) : ?>
            <a href="?annee=<?php echo $annee; ?>" class="<?php echo $annee == $anneeSelectionnee ? 'active' : ''; ?>"><?php echo $annee; ?></a>
        <?php endforeach; ?>
    </div>

            <div class="resultats-rendus">
                <?php if (count($rendus) > 0) : ?>
                    <ul>
                        <?php foreach ($rendus as $rendu) : ?>
                            <li>
                                <span><div class="etudiantID"><?php echo strtoupper($rendu['nomEtudiant']) . ' ' . $rendu['prenomEtudiant']; ?></div><?php echo " - ".$rendu['titreSujet']; ?></span>
                                <a href="<?php echo $rendu['lienRendu']; ?>" class="pdf-link" target="_blank">PDF <?php echo $rendu['dateRendu']?></a>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                <?php else : ?>
                    <div>Aucun rendu trouvé pour l'année <?php echo $anneeSelectionnee; ?>.</div>
                <?php endif; ?>
            </div>
    <?php
} else {
    echo "<p>ID de catégorie de rendu non spécifié.</p>";
}
?>
        </div>
