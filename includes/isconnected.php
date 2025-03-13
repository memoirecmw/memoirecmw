<?php
session_start();
// Vérifier si l'utilisateur est connecté et est un étudiant
if (!isset($_SESSION['user_id']) || !isset($_SESSION['role']) || $_SESSION['role'] !== 'etudiant') {
    // Rediriger vers la page de connexion ou une autre page
 header("Location: module_connexion.php"); // Ou une autre page si nécessaire
 exit();
}