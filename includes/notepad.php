<?php
session_start();

$note = null;
$errorMessage = null;

if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['note'])) {
        try {
            $stmt = $pdo->prepare("SELECT idNote FROM bloc_note WHERE idCompteEtudiant = :user_id");
            $stmt->execute([':user_id' => $userId]);
            $existingNote = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($existingNote) {
                $stmt = $pdo->prepare("UPDATE bloc_note SET descriptionNote = :note WHERE idCompteEtudiant = :user_id");
                $notification_message = "Bloc-notes enregistré !";
                $notification_type = "success";
            } else {
                $stmt = $pdo->prepare("INSERT INTO bloc_note (descriptionNote, idCompteEtudiant) VALUES (:note, :user_id)");
            }
            $stmt->execute([':note' => $_POST['note'], ':user_id' => $userId]);
        } catch (PDOException $e) {
            $errorMessage = "Erreur lors de l'enregistrement : " . $e->getMessage();
        }
    }

    try {
        $stmt = $pdo->prepare("SELECT descriptionNote FROM bloc_note WHERE idCompteEtudiant = :user_id");
        $stmt->execute([':user_id' => $userId]);
        $note = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $errorMessage = "Erreur lors de la récupération de la note : " . $e->getMessage();
    }
}
?>
<script>
    <?php if (isset($notification_message)) : ?>
    showNotification("<?php echo $notification_message; ?>", "<?php echo $notification_type; ?>");
    <?php endif; ?>
</script>
<div class="notepad main-content">
    <div id="notepadTitle">Bloc-notes</div>
    <div class="notepad-content">
        <form method="POST">
            <textarea id="userNote" name="note" <?php if (!$note) echo 'placeholder="Saisissez votre note ici..."'; ?>><?php if ($note && $note['descriptionNote']) echo htmlspecialchars($note['descriptionNote']); ?></textarea>
            <div class="notepad-button"><button class="bouton-bleu" type="submit">Enregistrer</button></div>
        </form>
    </div>
</div>