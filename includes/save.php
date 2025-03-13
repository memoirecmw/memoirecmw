<?php
session_start();

if (isset($_SESSION['user_id']) && isset($_POST['note'])) {
    $userId = $_SESSION['user_id'];
    $note = $_POST['note'];

    try {
        $stmt = $pdo->prepare("SELECT idNote FROM bloc_note WHERE idCompteEtudiant = :user_id");
        $stmt->execute([':user_id' => $userId]);
        $existingNote = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existingNote) {
            $stmt = $pdo->prepare("UPDATE bloc_note SET descriptionNote = :note WHERE idCompteEtudiant = :user_id");
        } else {
            $stmt = $pdo->prepare("INSERT INTO bloc_note (descriptionNote, idCompteEtudiant) VALUES (:note, :user_id)");
        }
        $stmt->execute([':note' => $note, ':user_id' => $userId]);
    } catch (PDOException $e) {
        error_log($e->getMessage());
    }
}
?>