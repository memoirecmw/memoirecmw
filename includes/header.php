<?php
session_start();
include "includes/dbConnect.php";
//DETERMINE LA PAGE SUR LAQUELLE L'UTILISATEUR EST

$nomFichier = basename($_SERVER['PHP_SELF']);
// on enlève rendu devant le nom
$nomFichier_bdd = str_replace('rendu-', '', $nomFichier);

// remplace le .php par du vide pour avoir uniquement le type de rendu (ex : bibliographie)
$currentPage = str_replace(['rendu-', '.php'], ['', ''], $nomFichier);
$currentPagebis = str_replace(['rendu-','.php', '-'], [' ','', ' de '], $nomFichier);

$page_active = basename($_SERVER['PHP_SELF']);
$rendu_pages = ['rendu-fiche-validation.php', 'rendu-bibliographie.php', 'rendu-fiche-terrain.php', 'rendu-plan.php'];
$is_rendu_page = in_array($page_active, $rendu_pages);
include "includes/isconnected.php";
include "includes/popup.php";
?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
      <link href="https://cdn.jsdelivr.net/npm/quill@2.0.0-beta.0/dist/quill.snow.css" rel="stylesheet" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />




    