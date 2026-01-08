<?php
session_start();

require_once '../includes/DatabaseConnection.php';

if (isset($_POST['login'])) {
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Chuẩn bị câu lệnh SQL
        $sql = "SELECT * FROM `member` WHERE `username` = ?";
        $query = $pdo->prepare($sql);
        $query->execute(array($username));
        $fetch = $query->fetch(PDO::FETCH_ASSOC);

        // Kiểm tra nếu người dùng tồn tại
        if ($fetch && password_verify($password, $fetch['password'])) {
            $_SESSION['user'] = $fetch['mem_id'];
            $_SESSION['role'] = $fetch['role'];
            if ($_SESSION['role'] == 'admin') {
                header("location: ../admin/views/admin_layout.html.php");
            } else {
                header("location: ../templates/homelogin.html.php");
            }
        } else {
            echo "
            <script>alert('Invalid username or password')</script>
            <script>window.location = '../index.php'</script>
            ";
        }
    } else {
        echo "
            <script>alert('Please complete the required field!')</script>
            <script>window.location = '../index.php'</script>
        ";
    }
}
?>