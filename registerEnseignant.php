<?php
include "includes/dbConnect.php";
include "includes/validate_registrationEnseignant.php"; ?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mémoire CMW - INSCRIPTION</title>
    <link rel="stylesheet" href="css/login.css">

</head>
<body>
<div class="login-container">
<form method="POST" action="
<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <h2>MÉMOIRE CMW</h2>
  <?  if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if ($errors > 0) {
    echo "<div class='error-message'>" . $errors_flag . "</div>";
    }else{
        echo "Tout est bon pour moi !<br>";
    }
    } ?>
    <label for="mailEnseignant"></label>
    <input type="email" id="mailEnseignant" name="mailEnseignant" placeholder="Email" required><br>
    <label for="nomEnseignant"></label>
    <input type="text" id="nomEnseignant" name="nomEnseignant" placeholder="Nom" required><br>
    <label for="prenomEnseignant"></label>
    <input type="text" id="prenomEnseignant" name="prenomEnseignant" placeholder="Prénom" required><br>

    <label for="mdpEnseignantEnseignant"></label>
    <input type="password" id="mdpEnseignant" name="mdpEnseignant" placeholder="Mot de passe" required><br>
    <label for="cmdpEnseignant"></label>
    <input type="password" id="cmdpEnseignant" name="cmdpEnseignant" placeholder="Confirmation" required><br>
    <button type="submit">Inscription</button>

</form>
</div>
<?php include "includes/include_script.php";?>
</body>

</html>

