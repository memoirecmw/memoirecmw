<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $newName = $_POST['newName'];
    $isGroup = $_POST['isGroup'] === 'true';

    try {
        if ($isGroup) {
            $stmt = $pdo->prepare("UPDATE groupe_tache SET titreGroupeTache = :titreGroupeTache WHERE idGroupeTache = :idGroupeTache");
            $stmt->execute([':titreGroupeTache' => $newName, ':idGroupeTache' => $id]);
        } else {
            $stmt = $pdo->prepare("UPDATE tache SET titreTache = :titreTache WHERE idTache = :idTache");
            $stmt->execute([':titreTache' => $newName, ':idTache' => $id]);
        }
    } catch (PDOException $e) {
        // Gérer les erreurs de base de données
        http_response_code(500);
        echo "Erreur lors de la mise à jour du nom : " . $e->getMessage();
    }
} else {
    // Gérer les requêtes non-POST
    http_response_code(405);
  //  echo "Méthode non autorisée.";
}
?>