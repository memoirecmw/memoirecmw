<?php
include "includes/dbConnect.php";
include "includes/validate_registration.php";
include "includes/popup.php";?>

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

    <label for="mailEtudiant"></label>
    <input type="email" id="mailEtudiant" name="mailEtudiant" placeholder="Email" required><br>
    <label for="nomEtudiant"></label>
    <input type="text" id="nomEtudiant" name="nomEtudiant" placeholder="Nom" required><br>
    <label for="prenomEtudiant"></label>
    <input type="text" id="prenomEtudiant" name="prenomEtudiant" placeholder="Prénom" required><br>

    <div>

        <input type="radio" id="groupeEtudiant1" name="groupeEtudiant" value="1" required>
        <label for="groupeEtudiant1">Groupe 1</label>

        <input type="radio" id="groupeEtudiant2" name="groupeEtudiant" value="2" required>
        <label for="groupeEtudiant2">Groupe 2</label>
    </div>

    <label for="mdpEtudiantEtudiant"></label>
    <input type="password" id="mdpEtudiant" name="mdpEtudiant" placeholder="Mot de passe" required><br>
    <label for="cmdpEtudiant"></label>
    <input type="password" id="cmdpEtudiant" name="cmdpEtudiant" placeholder="Confirmation" required><br>
    <button type="submit">Inscription</button>

</form>
</div>
<?php include "includes/include_script.php";?>
<script>
    <?php if (isset($_SESSION['notification_message'])) : ?>
    showNotification("<?php echo $_SESSION['notification_message']; ?>", "<?php echo $_SESSION['notification_type']; ?>");
    <?php unset($_SESSION['notification_message']); unset($_SESSION['notification_type']); ?>
    <?php endif; ?>
</script>  
</body>

</html>

