<?php include "includes/header.php"?>
<title>Profil</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<?php include 'includes/nav.php'; 

// $email = null;

// try {
//     $stmt = $pdo->prepare("SELECT mailEtudiant FROM compte_etudiant WHERE idCompteEtudiant = :id");
//     $stmt->execute([':id' => $_SESSION['user_id']]);
//     $result = $stmt->fetch(PDO::FETCH_ASSOC);
//     if ($result) {
//         $email = $result['mailEtudiant'];
//     }
// } catch (PDOException $e) {
//     $errorMessage = "Erreur lors de la récupération de l'email : " . $e->getMessage();
// }


$email = null;
$titreSujet = null;

try {
    // Récupération de l'email de l'étudiant
    $stmt1 = $pdo->prepare("SELECT mailEtudiant FROM compte_etudiant WHERE idCompteEtudiant = :id");
    $stmt1->execute([':id' => $_SESSION['user_id']]);
    $result1 = $stmt1->fetch(PDO::FETCH_ASSOC);
    
    if ($result1) {
        $email = $result1['mailEtudiant'];
        $idSujet = $result1['idSujet'];

        // Récupération du titre du sujet
        $stmt2 = $pdo->prepare("SELECT titreSujet FROM sujet WHERE idCompteEtudiant = :id");
        $stmt2->execute([':id' => $_SESSION['user_id']]);
        $result2 = $stmt2->fetch(PDO::FETCH_ASSOC);

        if ($result2) {
            $titreSujet = $result2['titreSujet'];
        }
    }
} catch (PDOException $e) {
    $errorMessage = "Erreur lors de la récupération des données : " . $e->getMessage();
}


// $sujet = null;

// try {
//     $stmt = $pdo->prepare("SELECT titreSujet FROM sujet WHERE idCompteEtudiant = :id");
//     $stmt->execute([':id' => $_SESSION['user_id']]);
//     $resultSujet = $stmt->fetch(PDO::FETCH_ASSOC);
//     if ($resultSujet) {
//         $sujet = $resultSujet['titreSujet'];
//     }
// }

        

?>
<main>

    <div class="profile-cont main-content">

        <div class="profil-haut main-center">
            <img src="img/icone-profil.png" alt="Avatar">
            <div id="profil-details">
                <h3><?php echo strtoupper($_SESSION['nom']). " " .$_SESSION['prenom']; ?></h3>
                <p class="it-mail"><?php echo $email; ?></p>
            </div>
<!--             <?php echo "<pre>";print_r($_SESSION)?>
            <div class="status-indicator">S</div> -->    
        </div>


<div class="sujet-profil"><h4>Sujet du mémoire :</h4><span><?php echo " ".$titreSujet; ?></span></div>

</div>


    <form class="main-center" method="POST" action="includes/logout.php">
        <button class="bouton-bleu" type="submit">Déconnexion</button>
    </form>
</main>
<?php include "includes/include_script.php";?>
  </body>
  


</html>
