<?php 
include "includes/dbConnect.php";
include "connexion.php";


?>


<title>Connexion</title>
<link rel="stylesheet" href="css/login.css">
<?php include "includes/include_script.php";?>
</head>
<body>

<div class="login-container">
    <h2>MÉMOIRE CMW</h2>
    <?php
    session_start();

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // ... Votre code PHP de traitement du formulaire ...
        if ($errors > 0) {
            echo "<div class='error-message'>" . $errors_flag . "</div>";
        }
    }
    ?>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <input type="email" name="mail" placeholder="Email" value="<?php echo isset($mail) ? $mail : ''; ?>">
        <input type="password" name="mdp" placeholder="Mot de passe">
        <button type="submit">Connexion</button>
    </form>
</div>
</body>
</html>