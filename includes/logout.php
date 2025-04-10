<?php
// Détruit toutes les variables de session
session_unset();

// Détruit la session
session_destroy();

// Redirige l'utilisateur vers la page de connexion ou la page d'accueil
header("Location: ../index.php"); // Remplacez index.php par votre page de connexion
?>