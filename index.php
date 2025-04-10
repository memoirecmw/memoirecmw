<?php include "includes/header.php"; ?>

<title>Accueil</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<?php include "includes/include_script.php";?>
</head>
<body>
<?php include 'includes/nav.php'; ?>
<main class="main-center">
    <section class="cal-todo">
        <?php include 'includes/calendar.php'; ?>
        <?php include "includes/todo.php"; ?> <!-- Vérifiez que cette inclusion est correcte -->
    </section>
    <?php include "includes/notepad.php"; ?>
</main>

</body>



</html>
