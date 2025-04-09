<?php include "includes/header.php"?>
<title>Profil</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<?php include 'includes/nav.php'; ?>
<main class="main-center profile-cont">


        <div class="profile-details main-content">
            <!-- <img src="avatar.png" alt="Avatar" class="avatar"> -->
            <h3><?php echo strtoupper($_SESSION['nom']). " " .$_SESSION['prenom']; ?></h3>
            <p><?php echo $mail; ?></p>
<!--             <?php echo "<pre>";print_r($_SESSION)?>
            <div class="status-indicator">S</div> -->

            <h4>Sujet du mémoire : <?php echo $_POST['sujet']; ?></h4>
        </div>





    <form method="POST" action="includes/logout.php">
        <button type="submit">Déconnexion</button>
    </form>
</main>
<?php include "includes/include_script.php";?>
  </body>
  


</html>
