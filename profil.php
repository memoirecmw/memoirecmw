<?php include "includes/header.php"?>
<title>Profil</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<?php include "includes/include_script.php";?>
</head>
<body>
<?php include 'includes/nav.php'; ?>
<main class="main-center profile-cont">

        <div class="profile-details">
            <img src="avatar.png" alt="Avatar" class="avatar">
            <h3><?php echo strtoupper($_SESSION['nom']). " " .$_SESSION['prenom']; ?></h3>
            <p><?php echo $email; ?></p>
            <?php echo "<pre>";print_r($_SESSION)?>x
            <div class="status-indicator">ziziziS</div>
        </div>





    <form method="POST" action="includes/logout.php">
        <button type="submit">Déconnexion</button>
    </form>
</main>
  </body>
  


</html>
