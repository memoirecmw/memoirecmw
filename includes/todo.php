<?php

$idUtilisateurConnecte = $_SESSION['user_id'] ?? null;


function query($pdo, $sql, $params = []) {
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    return $stmt;
}

function fetch($pdo, $sql, $params = []) {
    $stmt = query($pdo, $sql, $params);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function fetchAll($pdo, $sql, $params = []) {
    $stmt = query($pdo, $sql, $params);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// **Gestion des groupes de tâches**
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action_groupe_todo'])) {
    // ... (votre code de gestion des groupes reste le même)
    switch ($_POST['action_groupe_todo']) {
        case 'creer':
            if (isset($_POST['titre_nouveau_groupe_todo']) && !empty($_POST['titre_nouveau_groupe_todo'])) {
                $sql = "INSERT INTO groupe_tache (titreGroupeTache, idCompteEtudiant) VALUES (:titre, :idEtudiant)";
                query($pdo, $sql, [':titre' => $_POST['titre_nouveau_groupe_todo'], ':idEtudiant' => $idUtilisateurConnecte]);
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            }
            break;
        case 'renommer':
            if (isset($_POST['id_groupe_renommer_todo']) && isset($_POST['nouveau_titre_groupe_todo']) && !empty($_POST['nouveau_titre_groupe_todo'])) {
                $sql = "UPDATE groupe_tache SET titreGroupeTache = :nouveauTitre WHERE idGroupeTache = :idGroupe AND idCompteEtudiant = :idEtudiant";
                query($pdo, $sql, [':nouveauTitre' => $_POST['nouveau_titre_groupe_todo'], ':idGroupe' => $_POST['id_groupe_renommer_todo'], ':idEtudiant' => $idUtilisateurConnecte]);
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            }
            break;
        case 'supprimer':
            if (isset($_POST['id_groupe_supprimer_todo'])) {
                $sqlSupprimerTaches = "DELETE FROM tache WHERE idGroupeTache = :idGroupe";
                query($pdo, $sqlSupprimerTaches, [':idGroupe' => $_POST['id_groupe_supprimer_todo']]);
                $sqlSupprimerGroupe = "DELETE FROM groupe_tache WHERE idGroupeTache = :idGroupe AND idCompteEtudiant = :idEtudiant";
                query($pdo, $sqlSupprimerGroupe, [':idGroupe' => $_POST['id_groupe_supprimer_todo'], ':idEtudiant' => $idUtilisateurConnecte]);
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            }
            break;
    }
}

// **Gestion des tâches**
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action_tache_todo'])) {
    // ... (votre code de gestion des tâches reste le même)
    switch ($_POST['action_tache_todo']) {
        case 'creer':
            if (isset($_POST['id_groupe_tache_todo']) && isset($_POST['titre_nouvelle_tache_todo']) && !empty($_POST['titre_nouvelle_tache_todo'])) {
                $sqlVerifierGroupe = "SELECT COUNT(*) FROM groupe_tache WHERE idGroupeTache = :idGroupe AND idCompteEtudiant = :idEtudiant";
                $stmtVerifierGroupe = query($pdo, $sqlVerifierGroupe, [':idGroupe' => $_POST['id_groupe_tache_todo'], ':idEtudiant' => $idUtilisateurConnecte]);
                if ($stmtVerifierGroupe->fetchColumn() > 0) {
                    $sql = "INSERT INTO tache (idGroupeTache, titreTache, validation) VALUES (:idGroupe, :titre, 0)";
                    query($pdo, $sql, [':idGroupe' => $_POST['id_groupe_tache_todo'], ':titre' => $_POST['titre_nouvelle_tache_todo']]);
                    header("Location: " . $_SERVER['PHP_SELF']);
                    exit();
                } else {
                    echo "<p style='color:red;'>Erreur : Le groupe de tâches spécifié n'existe pas ou ne vous appartient pas.</p>";
                }
            }
            break;
        case 'renommer':
            if (isset($_POST['id_tache_renommer_todo']) && isset($_POST['nouveau_titre_tache_todo']) && !empty($_POST['nouveau_titre_tache_todo'])) {
                $sql = "UPDATE tache t
                                INNER JOIN groupe_tache gt ON t.idGroupeTache = gt.idGroupeTache
                                SET t.titreTache = :nouveauTitre
                                WHERE t.idTache = :idTache AND gt.idCompteEtudiant = :idEtudiant";
                query($pdo, $sql, [':nouveauTitre' => $_POST['nouveau_titre_tache_todo'], ':idTache' => $_POST['id_tache_renommer_todo'], ':idEtudiant' => $idUtilisateurConnecte]);
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            }
            break;
        case 'supprimer':
            if (isset($_POST['id_tache_supprimer_todo'])) {
                $sql = "DELETE tache FROM tache
                                INNER JOIN groupe_tache gt ON tache.idGroupeTache = gt.idGroupeTache
                                WHERE tache.idTache = :idTache AND gt.idCompteEtudiant = :idEtudiant";
                query($pdo, $sql, [':idTache' => $_POST['id_tache_supprimer_todo'], ':idEtudiant' => $idUtilisateurConnecte]);
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            }
            break;
        case 'valider':
            if (isset($_POST['id_tache_valider_todo'])) {
                $validation = isset($_POST['validation_todo']) ? 1 : 0;
                $sql = "UPDATE tache t
                                INNER JOIN groupe_tache gt ON t.idGroupeTache = gt.idGroupeTache
                                SET t.validation = :validation
                                WHERE t.idTache = :idTache AND gt.idCompteEtudiant = :idEtudiant";
                query($pdo, $sql, [':validation' => $validation, ':idTache' => $_POST['id_tache_valider_todo'], ':idEtudiant' => $idUtilisateurConnecte]);
                header("Location: " . $_SERVER['PHP_SELF']);
                exit();
            }
            break;
    }
}

// **Récupérer les groupes de tâches de l'utilisateur**
$sqlGroupes = "SELECT * FROM groupe_tache WHERE idCompteEtudiant = :idEtudiant ORDER BY titreGroupeTache";
$groupes = fetchAll($pdo, $sqlGroupes, [':idEtudiant' => $idUtilisateurConnecte]);

?>

<div class="todo-container main-content">
    <h2 class="todo-title">To Do</h2>

    <div class="new-group">
        <form method="post" class="new-group-form">
            <input type="hidden" name="action_groupe_todo" value="creer">
            <input type="text" name="titre_nouveau_groupe_todo" placeholder="Nouveau groupe" class="new-group-input" required>
            <button type="submit" class="new-group-button">+</button>
        </form>
    </div>

    <div class="task-groups-wrapper">
        <?php if (!empty($groupes)): ?>
            <?php foreach ($groupes as $groupe): ?>
                <div class="task-group">
                    <div class="task-group-header">
                        <h3 class="task-group-title"><?php echo htmlspecialchars($groupe['titreGroupeTache']); ?></h3>
                        <div class="task-group-actions">
                            <button class="edit-group-button" onclick="toggleEditGroup(<?php echo $groupe['idGroupeTache']; ?>)">
                                <i class="material-icons">edit</i>
                            </button>
                            <form method="post" style="display:inline;">
                                <input type="hidden" name="action_groupe_todo" value="supprimer">
                                <input type="hidden" name="id_groupe_supprimer_todo" value="<?php echo $groupe['idGroupeTache']; ?>">
                                <button type="submit" class="delete-group-button" onclick="return confirm('Supprimer ce groupe et ses tâches ?')">
                                    <i class="material-icons">delete</i>
                                </button>
                            </form>
                        </div>
                    </div>

                    <div id="edit-group-<?php echo $groupe['idGroupeTache']; ?>" class="edit-group-form" style="display:none;">
                        <form method="post" class="edit-group-actual-form">
                            <input type="hidden" name="action_groupe_todo" value="renommer">
                            <input type="hidden" name="id_groupe_renommer_todo" value="<?php echo $groupe['idGroupeTache']; ?>">
                            <input type="text" name="nouveau_titre_groupe_todo" class="edit-group-input" value="<?php echo htmlspecialchars($groupe['titreGroupeTache']); ?>" required>
                            <button type="submit" class="save-group-button">
                                <i class="material-icons">save</i>
                            </button>
                        </form>
                    </div>

                    <ul class="task-list">
                        <?php
                        $sqlTaches = "SELECT * FROM tache WHERE idGroupeTache = :idGroupe ORDER BY titreTache";
                        $taches = fetchAll($pdo, $sqlTaches, [':idGroupe' => $groupe['idGroupeTache']]);
                        if (!empty($taches)): ?>
                            <?php foreach ($taches as $tache): ?>
                                <li class="task-item">
                                    <div class="task-item-content">
                                        <form method="post" class="task-checkbox-form" style="display:inline;">
                                            <input type="checkbox" name="validation_todo" value="1" <?php if ($tache['validation']): ?>checked<?php endif; ?> onchange="this.form.submit()" class="task-checkbox">
                                            <input type="hidden" name="action_tache_todo" value="valider">
                                            <input type="hidden" name="id_tache_valider_todo" value="<?php echo $tache['idTache']; ?>">
                                        </form>
                                        <span class="task-title <?php if ($tache['validation']): ?>task-completed<?php endif; ?>"><?php echo htmlspecialchars($tache['titreTache']); ?></span>
                                        <div class="task-actions">
                                            <button class="edit-task-button" onclick="toggleEditTask(<?php echo $tache['idTache']; ?>)">
                                                <i class="material-icons">edit</i>
                                            </button>
                                            <form method="post" style="display:inline;">
                                                <input type="hidden" name="action_tache_todo" value="supprimer">
                                                <input type="hidden" name="id_tache_supprimer_todo" value="<?php echo $tache['idTache']; ?>">
                                                <button type="submit" class="delete-task-button" onclick="return confirm('Supprimer cette tâche ?')">
                                                    <i class="material-icons">delete</i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                    <div id="edit-task-<?php echo $tache['idTache']; ?>" class="edit-task-form" style="display:none;">
                                        <form method="post" class="edit-task-actual-form">
                                            <input type="hidden" name="action_tache_todo" value="renommer">
                                            <input type="hidden" name="id_tache_renommer_todo" value="<?php echo $tache['idTache']; ?>">
                                            <input type="text" name="nouveau_titre_tache_todo" class="edit-task-input" value="<?php echo htmlspecialchars($tache['titreTache']); ?>" required>
                                            <button type="submit" class="save-task-button">
                                                <i class="material-icons">save</i>
                                            </button>
                                        </form>
                                    </div>
                                </li>
                            <?php endforeach; ?>
                            <li class="new-task-inline">
                                <form method="post" class="new-task-inline-form">
                                    <input type="hidden" name="action_tache_todo" value="creer">
                                    <input type="hidden" name="id_groupe_tache_todo" value="<?php echo $groupe['idGroupeTache']; ?>">
                                    <input type="text" name="titre_nouvelle_tache_todo" placeholder="Nouvelle tâche" class="new-task-inline-input" required>
                                    <button type="submit" class="new-task-inline-button">+</button>
                                </form>
                            </li>
                        <?php else: ?>
                            <li class="new-task-inline">
                                <form method="post" class="new-task-inline-form">
                                    <input type="hidden" name="action_tache_todo" value="creer">
                                    <input type="hidden" name="id_groupe_tache_todo" value="<?php echo $groupe['idGroupeTache']; ?>">
                                    <input type="text" name="titre_nouvelle_tache_todo" placeholder="Nouvelle tâche" class="new-task-inline-input" required>
                                    <button type="submit" class="new-task-inline-button">+</button>
                                </form>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<!-- <style>
    .todo-container {
        width: 50%;
        background-color: #f7f7f7;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .todo-title {
        color: #333;
        margin-top: 0;
        margin-bottom: 20px;
        text-align: center;
        font-size: 1.5em;
    }

    .new-group-form {
        display: flex;
        margin-bottom: 15px;
    }

    .new-group-input {
        flex-grow: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
    }

    .new-group-button {
        background-color: #eee;
        color: #555;
        border: none;
        padding: 8px 15px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-left: 10px;
    }

    .task-groups-wrapper {
        max-height: 400px; /* Adjust the height as needed */
        overflow-y: auto;
        margin-top: 15px; /* Add some space below the new group input */
    }

    .task-group {
        background-color: white;
        border-radius: 8px;
        margin-bottom: 15px;
        padding: 15px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
    }

    .task-group-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }

    .task-group-title {
        color: #333;
        margin: 0;
        font-size: 1.2em;
    }

    .task-group-actions button {
        background-color: #555;
        border: none;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        margin-left: 5px;
    }

    .task-list {
        list-style: none;
        padding: 0;
    }

    .task-item {
        display: flex;
        align-items: center;
        padding: 8px 0;
    }

    .task-item-content {
        display: flex;
        align-items: center;
        flex-grow: 1;
    }

    .task-checkbox-form {
        margin-right: 10px;
    }

    .task-checkbox {
        width: 20px;
        height: 20px;
        margin-right: 8px;
        cursor: pointer;
        appearance: none;
        background-color: #eee;
        border: 1px solid #ccc;
        border-radius: 4px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .task-checkbox:checked::before {
        content: '\2713'; /* Checkmark */
        font-size: 16px;
        color: #5cb85c;
    }

    .task-title {
        flex-grow: 1;
        font-size: 16px;
        color: #333;
        margin-right: 10px; /* Add some space between title and actions */
    }

    .task-completed {
        text-decoration: line-through;
        color: #888;
    }

    .task-actions {
        display: flex;
        align-items: center;
    }

    .task-actions button {
        border: none;
        border-radius: 50%;
        width: 25px;
        height: 25px;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        margin-left: 5px;
    }
</style> -->