<?php
include 'includes/DatabaseConnection.php';
include 'includes/DatabaseFunctions.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $title = $_POST['title'];
    $content = $_POST['content'];
    $code = $_POST['code'];
    $mem_id = $_POST['mem_id'];
    $modules_id = $_POST['modules_id'];

    try {
        // Lấy thông tin modules_id hiện tại của câu hỏi
        $sql = "SELECT modules_id FROM questions WHERE id = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$id]);
        $currentQuestion = $stmt->fetch(PDO::FETCH_ASSOC);
        $currentModulesId = $currentQuestion['modules_id'];

        // Cập nhật câu hỏi
        if (!empty($_FILES['image']['tmp_name'])) {
            $image = $_FILES['image']['tmp_name'];
            $imageContent = file_get_contents($image);
            $imageType = $_FILES['image']['type'];

            $sql = "UPDATE questions SET title = ?, content = ?, code = ?, image = ?, image_type = ?, mem_id = ?, modules_id = ? WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(1, $title);
            $stmt->bindParam(2, $content);
            $stmt->bindParam(3, $code);
            $stmt->bindParam(4, $imageContent);
            $stmt->bindParam(5, $imageType);
            $stmt->bindParam(6, $mem_id);
            $stmt->bindParam(7, $modules_id);
            $stmt->bindParam(8, $id);
        } else {
            $sql = "UPDATE questions SET title = ?, content = ?, code = ?, mem_id = ?, modules_id = ? WHERE id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(1, $title);
            $stmt->bindParam(2, $content);
            $stmt->bindParam(3, $code);
            $stmt->bindParam(4, $mem_id);
            $stmt->bindParam(5, $modules_id);
            $stmt->bindParam(6, $id);
        }

        $stmt->execute();

        // Nếu modules_id thay đổi, cập nhật question_count (replaces TRIGGER)
        updateModuleQuestionCounts($pdo, $currentModulesId, $modules_id);
        $stmt = $pdo->prepare("UPDATE questions SET edited_at = NOW() WHERE id = ?");
        $stmt->execute([$id]);

        header('Location: templates/homelogin.html.php');
        exit();
    } catch (Exception $e) {
        echo "Error updating question! " . $e->getMessage();
    }
}
?>