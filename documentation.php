<?php include "includes/header.php";?>
<title>Documentation</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<?php include 'includes/nav.php'; ?>

<main>
    <div class='main-content'>
        <?php
        $query_categoriesdoc = $pdo->query("SELECT * FROM categorie_documentation");
        $categories_documentation = $query_categoriesdoc->fetchAll();

        if ($categories_documentation) {
            foreach ($categories_documentation as $categoriedoc) {
                echo "<div><h3>".$categoriedoc['titreCategorieDocumentation']."</h3>";

                $query_documentations = $pdo->prepare("SELECT * FROM documentation WHERE idCategorieDocumentation = ?");
                $query_documentations->execute([$categoriedoc['idCategorieDocumentation']]);
                $documentations = $query_documentations->fetchAll();

                if ($documentations) {
                    echo "<div class='documentation".($categoriedoc['idCategorieDocumentation'] === '4' ? ' fleche' : '')."'>";
                    foreach ($documentations as $documentation) {
                        echo "<a href='#' class='documentation-link' data-id='".$documentation['idDocumentation']."' data-description='".$documentation['descriptionDocumentation']."' data-title='".$documentation['titreDocumentation']."'>".$documentation['titreDocumentation']."</a>";
                    }
                    echo "</div>";
                } else {
                    echo "<p>Aucune documentation.</p>";
                }

                echo "</div>";
            }
        }
        ?>
    </div>

    <div id="popup" class="popup">
        <span class="close-button">&times;</span>
        <div id="popup-content-inner"></div>
    </div>
</main>
<?php include "includes/include_script.php";?>
</body>
</html>