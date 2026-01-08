<?php 

include 'includes/DatabaseConnection.php';
include 'includes/DatabaseFunctions.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title   = $_POST['title'];
    $content = $_POST['content'];
    $code = $_POST['code'];
    $mem_id = $_POST['mem_id'];
    $modules_id = $_POST['modules_id'];

    if (!empty($_FILES['image']['tmp_name'])) {
        $image = $_FILES['image']['tmp_name'];
        $imageContent = file_get_contents($image);
        $imageType = $_FILES['image']['type'];

        $stmt = $pdo->prepare("INSERT INTO questions (title, content, code,image, image_type, mem_id, modules_id) VALUES (?,?,?,?,?,?,?)");
        $stmt->bindParam(1, $title);
        $stmt->bindParam(2, $content);
        $stmt->bindParam(3, $code);
        $stmt->bindParam(4, $imageContent);
        $stmt->bindParam(5, $imageType);
        $stmt->bindParam(6, $mem_id);
        $stmt->bindParam(7, $modules_id);
    } else {
        $stmt = $pdo->prepare("INSERT INTO questions (title, content, code, mem_id, modules_id) VALUES (?,?,?,?,?)");
        $stmt->bindParam(1, $title);
        $stmt->bindParam(2, $content);
        $stmt->bindParam(3, $code);
        $stmt->bindParam(4, $mem_id);
        $stmt->bindParam(5, $modules_id);
    }

    try {
        // Insert new questions into 'questions' table 
        $stmt->execute();
        
        // Increment question count in modules table (replaces TRIGGER)
        incrementModuleQuestionCount($pdo, $modules_id);
        exit();
    } catch (Exception $e) {
        echo "An error occurred while posting a question: " . $e->getMessage();
    }
}
?>
