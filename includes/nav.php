
<nav>
    <a href="index.php"><h1>MÉMOIRE CMW</h1></a>
    <hr>

    <ul>
        <a href="index.php"><li class="li-nav <?php if ($page_active == 'index.php') echo 'active'; ?>">
                <img class="icon" src="img/list-check.png">Organisation
            </li></a>

        <a href="documentation.php"><li class="li-nav <?php if ($page_active == 'documentation.php') echo 'active'; ?>">
                <img class="icon" src="img/folder-fill.png">Documentation
            </li></a>

        <a href="ressources.php"><li class="li-nav <?php if ($page_active == 'ressources.php') echo 'active'; ?>">
                <img class="icon" id="ressources-icon" src="img/books.png">Ressources
            </li></a>


        <li id="rendus" class="li-nav <?php if ($is_rendu_page) echo 'active'; ?>"><img class="icon" src="img/download.png">Dépôt</li>
        <ul id="rendus-nav" <?php if ($is_rendu_page) echo 'style="display: block;"'; else echo 'style="display: none;"'; ?>>
            <a href="rendu-fiche-validation.php">
                <li class="li-nav <?php if ($page_active == 'rendu-fiche-validation.php') echo 'active'; ?>">Fiche validation</li></a>

            <a href="rendu-bibliographie.php">
                <li class="li-nav <?php if ($page_active == 'rendu-bibliographie.php') echo 'active'; ?>">Bibliographie</li></a>

            <a href="rendu-fiche-terrain.php">
                <li class="li-nav <?php if ($page_active == 'rendu-fiche-terrain.php') echo 'active'; ?>">Fiche terrain</li></a>

            <a href="rendu-plan.php">
                <li class="li-nav <?php if ($page_active == 'rendu-plan.php') echo 'active'; ?>">Plan</li></a>

            <a href="rendu-mini-soutenance.php">
                <li class="li-nav <?php if ($page_active == 'rendu-mini-soutenance.php') echo 'active'; ?>">Mini-soutenance</li></a>
        </ul>
    </ul>

    <a href="profil.php"><div class="profil">Profil</div></a>
</nav>