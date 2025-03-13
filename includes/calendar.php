<?php
// Inclure votre fichier de connexion à la base de données

// Récupérer les rendus du mois de septembre (exemple)
$mois = 11; // Septembre
$annee = 2025; // Année

try {
    $stmt = $pdo->prepare("SELECT * FROM rendu WHERE MONTH(dateRendu) = :mois AND YEAR(dateRendu) = :annee");
    $stmt->execute([':mois' => $mois, ':annee' => $annee]);
    $rendus = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Erreur lors de la récupération des rendus : " . $e->getMessage();
    exit;
}

// Créer un tableau associatif pour stocker les rendus par jour
$rendusParJour = [];
foreach ($rendus as $rendu) {
    $jour = date('j', strtotime($rendu['dateRendu']));
    $rendusParJour[$jour][] = $rendu;
}

// Fonction pour générer le calendrier
function genererCalendrier($mois, $annee, $rendusParJour) {
    $premierJour = mktime(0, 0, 0, $mois, 1, $annee);
    $nombreJours = date('t', $premierJour);

    $jourSemainePremierJour = date('w', $premierJour);
    $jourSemainePremierJour = ($jourSemainePremierJour == 0) ? 6 : $jourSemainePremierJour - 1;

    $calendrier = '<div class="calendrier">';
    $calendrier .= '<h2>' . date('F', $premierJour) . '</h2>';
    $calendrier .= '<table>';
    $calendrier .= '<tr><th>L</th><th>M</th><th>M</th><th>J</th><th>V</th><th>S</th><th>D</th></tr>';
    $calendrier .= '<tr>';

    // Remplir les jours vides avant le premier jour du mois
    for ($i = 0; $i < $jourSemainePremierJour; $i++) {
        $calendrier .= '<td></td>';
    }

    // Remplir les jours du mois
    for ($jour = 1; $jour <= $nombreJours; $jour++) {
        $jourSemaine = ($jourSemainePremierJour + $jour - 1) % 7;
        if ($jourSemaine == 0 && $jour != 1) {
            $calendrier .= '</tr><tr>';
        }

        $rendusDuJour = isset($rendusParJour[$jour]) ? $rendusParJour[$jour] : [];
        $calendrier .= '<td class="' . (!empty($rendusDuJour) ? 'rendu' : '') . '">';
        $calendrier .= $jour;

        if (!empty($rendusDuJour)) {
            $calendrier .= '<div class="rendus-jour">';
            foreach ($rendusDuJour as $rendu) {
                $calendrier .= '<div class="rendu-item">';
                $calendrier .= '<span class="rendu-nom">' . $rendu['nomRendu'] . '</span>';
                $calendrier .= '</div>';
            }
            $calendrier .= '</div>';
        }

        $calendrier .= '</td>';
    }

    // Remplir les jours vides après le dernier jour du mois
    while (($jourSemainePremierJour + $nombreJours) % 7 != 0) {
        $calendrier .= '<td></td>';
        $nombreJours++;
    }

    $calendrier .= '</tr></table>';
    $calendrier .= '</div>';

    return $calendrier;
}

// Afficher le calendrier
echo genererCalendrier($mois, $annee, $rendusParJour);
?>