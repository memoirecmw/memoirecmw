<?php
session_start();
include "includes/update_name.php";

$errorMessage = null;
$userId = $_SESSION['user_id'];

// Récupérer les groupes de tâches de l'utilisateur
try {
    $stmt = $pdo->prepare("SELECT * FROM groupe_tache WHERE idCompteEtudiant = :user_id");
    $stmt->execute([':user_id' => $userId]);
    $groupesTaches = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $errorMessage = "Erreur lors de la récupération des groupes de tâches : " . $e->getMessage();
}

// Récupérer les tâches pour chaque groupe
$taches = [];
foreach ($groupesTaches as $groupe) {
    try {
        $stmt = $pdo->prepare("SELECT * FROM tache WHERE idGroupeTache = :idGroupeTache");
        $stmt->execute([':idGroupeTache' => $groupe['idGroupeTache']]);
        $taches[$groupe['idGroupeTache']] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors de la récupération des tâches : " . $e->getMessage();
    }
}

// Gestion de l'ajout d'un groupe de tâches
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['addGroup'])) {
    try {
        $stmt = $pdo->prepare("INSERT INTO groupe_tache (titreGroupeTache, idCompteEtudiant) VALUES ('Untitled', :idCompteEtudiant)");
        $stmt->execute([':idCompteEtudiant' => $userId]);
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors de l'ajout du groupe de tâches : " . $e->getMessage();
    }
}

// Gestion de l'ajout d'une tâche
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['addTask']) && isset($_POST['groupId'])) {
    try {
        $stmt = $pdo->prepare("INSERT INTO tache (titreTache, idGroupeTache) VALUES ('Untitled', :idGroupeTache)");
        $stmt->execute([':idGroupeTache' => $_POST['groupId']]);
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors de l'ajout de la tâche : " . $e->getMessage();
    }
}

// Gestion du renommage d'un groupe de tâches
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['renameGroup']) && isset($_POST['groupId']) && isset($_POST['newGroupName'])) {
    try {
        $stmt = $pdo->prepare("UPDATE groupe_tache SET titreGroupeTache = :titreGroupeTache WHERE idGroupeTache = :idGroupeTache");
        $stmt->execute([':titreGroupeTache' => $_POST['newGroupName'], ':idGroupeTache' => $_POST['groupId']]);
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors du renommage du groupe de tâches : " . $e->getMessage();
    }
}

// Gestion du renommage d'une tâche
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['renameTask']) && isset($_POST['taskId']) && isset($_POST['newTaskName'])) {
    try {
        $stmt = $pdo->prepare("UPDATE tache SET titreTache = :titreTache WHERE idTache = :idTache");
        $stmt->execute([':titreTache' => $_POST['newTaskName'], ':idTache' => $_POST['taskId']]);
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors du renommage de la tâche : " . $e->getMessage();
    }
}

// Gestion de la suppression d'un groupe de tâches
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteGroup']) && isset($_POST['groupId'])) {
    try {
        $stmt = $pdo->prepare("DELETE FROM tache WHERE idGroupeTache = :idGroupeTache");
        $stmt->execute([':idGroupeTache' => $_POST['groupId']]);

        $stmt = $pdo->prepare("DELETE FROM groupe_tache WHERE idGroupeTache = :idGroupeTache");
        $stmt->execute([':idGroupeTache' => $_POST['groupId']]);
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors de la suppression du groupe de tâches : " . $e->getMessage();
    }
}

// Gestion de la suppression d'une tâche
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteTask']) && isset($_POST['taskId'])) {
    try {
        $stmt = $pdo->prepare("DELETE FROM tache WHERE idTache = :idTache");
        $stmt->execute([':idTache' => $_POST['taskId']]);
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors de la suppression de la tâche : " . $e->getMessage();
    }
}

// Gestion de la validation d'une tâche
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['validateTask']) && isset($_POST['taskId'])) {
    try {
        $stmt = $pdo->prepare("SELECT validation FROM tache WHERE idTache = :idTache");
        $stmt->execute([':idTache' => $_POST['taskId']]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $currentValidation = $result['validation'];

        $newValidation = $currentValidation ? 0 : 1; // Inverser la valeur

        $stmt = $pdo->prepare("UPDATE tache SET validation = :newValidation WHERE idTache = :idTache");
        $stmt->execute([':newValidation' => $newValidation, ':idTache' => $_POST['taskId']]);
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors de la validation de la tâche : " . $e->getMessage();
    }
}
?>
<div class="todo-list">
    <input type="text" placeholder="Nouveau groupe" class="new-group-input">

    <div class="scrollable-content">
        <?php foreach ($groupesTaches as $groupe): ?>
            <div class="group">
                <h3 contenteditable="true" data-id="<?php echo $groupe['idGroupeTache']; ?>">
                    <?php echo htmlspecialchars($groupe['titreGroupeTache']); ?>
                    <i class="fas fa-trash-alt delete-group"></i>
                </h3>
                <ul>
                    <?php foreach ($taches[$groupe['idGroupeTache']] as $tache): ?>
                        <li data-id="<?php echo $tache['idTache']; ?>" class="<?php echo $tache['validation'] ? 'completed' : ''; ?>">
                            <input type="checkbox" <?php echo $tache['validation'] ? 'checked' : ''; ?>>
                            <span contenteditable="true"><?php echo htmlspecialchars($tache['titreTache']); ?></span>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <input type="text" placeholder="Nouvelle tâche" class="new-task-input">
            </div>
        <?php endforeach; ?>
    </div>
</div>