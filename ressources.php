<?php include "includes/header.php";?>
<title>Ressources</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />

</head>
<body>
<?php include 'includes/nav.php'; ?>

<main>

<div class='main-content'>
      
<?php

$query_categories = $pdo->query("SELECT * FROM categorie_ressources");
$categories_ressources = $query_categories->fetchAll();

if ($categories_ressources) {
    foreach ($categories_ressources as $categorie) {
        echo "<div id='bloc-ressources'><h3>".$categorie['titreCategorieRessources']."</h3>";

        $query_ressources = $pdo->prepare("SELECT * FROM ressource WHERE idCategorieRessources = ?");
        $query_ressources->execute([$categorie['idCategorieRessources']]);
        $ressources = $query_ressources->fetchAll();

        if ($ressources) {
            echo "<div class='ressources'>";
            foreach ($ressources as $ressource) {
                echo "<a target='_blank' href='".$ressource['lienRessource']."'>".$ressource['titreRessource']."</a><br>";
            }
            echo "</div>";
        } else {
            echo "<p>Aucune ressource disponible.</p>";
        }

        echo "</div>";
    }
} else {
    echo "<p>Aucune catégorie.</p>";
}
?>





</div>

    </main>
<?php include "includes/include_script.php";?>
  </body>
  

</html>
