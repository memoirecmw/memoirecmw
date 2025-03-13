<?php
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'autorisationAdmin') {
    // Rediriger vers la page de connexion ou une autre page
    header("Location: index.php"); // Ou une autre page si nécessaire
    exit();
}
