<?php

function registerUser($pdo, $data) {
    if (!empty($data['firstname']) && !empty($data['username']) && !empty($data['password'])) {
        try {
            $firstname = htmlspecialchars($data['firstname']);
            $lastname = htmlspecialchars($data['lastname']);
            $username = htmlspecialchars($data['username']);
            $password = htmlspecialchars($data['password']);
            $displayname = htmlspecialchars($data['displayname']);
            $dob = htmlspecialchars($data['dob']);
            $phone = htmlspecialchars($data['phone']);
            $email = htmlspecialchars($data['email']);

            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            $sql = "INSERT INTO member (firstname, lastname, username, password, displayname, dob, phone, email) VALUES (:firstname, :lastname, :username, :password, :displayname, :dob, :phone, :email)";
            $stmt = $pdo->prepare($sql);

            $stmt->bindParam(':firstname', $firstname);
            $stmt->bindParam(':lastname', $lastname);
            $stmt->bindParam(':username', $username);
            $stmt->bindParam(':password', $hashed_password);
            $stmt->bindParam(':displayname', $displayname);
            $stmt->bindParam(':dob', $dob);
            $stmt->bindParam(':phone', $phone);
            $stmt->bindParam(':email', $email);

            if ($stmt->execute()) {
                // $_SESSION['message'] = array("text" => "User successfully created.", "alert" => "info");
                header('Location: views/students_show.html.php');
                exit();
            } else {
                return "Failed to insert data.";
            }

        } catch (PDOException $e) {
            return "Error: " . $e->getMessage();
        }
    } else {
        return "Please fill up the required fields!";
    }
}

function getCountById(PDO $pdo): int {
    $sql = "SELECT COUNT(mem_id) AS count FROM member";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    return $result['count'];
}

function getCountByQuestionId(PDO $pdo): int {
    $sql = "SELECT COUNT(id) AS count FROM questions";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    return $result['count'];
}



function getModulesById(PDO $pdo): int {
    $sql = "SELECT COUNT(modules_id) AS count FROM modules";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    return $result['count'];
}


function createModules($pdo, $data) {
    if (!empty($data['modules_name']) && !empty($data['modules_description']) && !empty($data['create_time'])) {
        try {
            $modules_name = htmlspecialchars($data['modules_name']);
            $modules_description = htmlspecialchars($data['modules_description']);
            $create_time = htmlspecialchars($data['create_time']);

            $sql = "INSERT INTO modules (modules_name, modules_description, create_time) VALUES (:modules_name, :modules_description, :create_time)";
            $stmt = $pdo->prepare($sql);

            $stmt->bindParam(':modules_name', $modules_name);
            $stmt->bindParam(':modules_description', $modules_description);
            $stmt->bindParam(':create_time', $create_time);


            if ($stmt->execute()) {
                // $_SESSION['message'] = array("text" => "User successfully created.", "alert" => "info");
                header('Location: views/modules_show.html.php');
                exit();
            } else {
                return "Failed to insert data.";
            }

        } catch (PDOException $e) {
            return "Error: " . $e->getMessage();
        }
    } else {
        return "Please fill up the required fields!";
    }
}

function getMemberInfo($pdo) {
    session_start(); // Bắt đầu session

    // Kiểm tra xem session user có tồn tại không
    if (!isset($_SESSION['user'])) {
        header("Location: index.php"); // Điều hướng về trang đăng nhập nếu user chưa đăng nhập
        exit();
    }

    $mem_id = $_SESSION['user'];

    // Lấy thông tin của thành viên hiện tại
    $sql = "SELECT * FROM member WHERE mem_id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$mem_id]);
    $member = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$member) {
        die("Member not found");
    }

    return $member;
}


function deleteQuestion($pdo, $id, $member) {
    session_start();

    // Truy vấn để lấy thông tin câu hỏi và người tạo câu hỏi
    $stmt = $pdo->prepare('SELECT mem_id, modules_id FROM questions WHERE id = ?');
    $stmt->execute([$id]);
    $question = $stmt->fetch(PDO::FETCH_ASSOC);

    // Kiểm tra nếu người dùng là người tạo câu hỏi hoặc là quản trị viên
    if ($question && ($question['mem_id'] == $member['mem_id'] || $member['role'] == 'admin')) {
        try {
            $modules_id = $question['modules_id'];
            
            $sql = "DELETE FROM questions WHERE id = :id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            
            if ($stmt->execute()) {
                // Decrement question count (replaces TRIGGER)
                decrementModuleQuestionCount($pdo, $modules_id);
                
                // Đặt thông báo thành công
                $_SESSION['message'] = array("text" => "Question successfully deleted.", "alert" => "info");
            } else {
                $_SESSION['message'] = array("text" => "Failed to delete the question.", "alert" => "danger");
            }
        } catch (PDOException $e) {
            $_SESSION['message'] = array("text" => "Error: " . $e->getMessage(), "alert" => "danger");
        }
    } else {
        $_SESSION['message'] = array("text" => "You are not authorized to delete this question.", "alert" => "danger");
    }
}

// ============================================
// HELPER FUNCTIONS FOR QUESTION COUNT MANAGEMENT
// (Replaces MySQL TRIGGERs for hosting compatibility)
// ============================================

/**
 * Increment question count for a module
 * Called after inserting a new question
 */
function incrementModuleQuestionCount($pdo, $modules_id) {
    try {
        $sql = "UPDATE modules SET questions_count = questions_count + 1 WHERE modules_id = :modules_id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':modules_id', $modules_id, PDO::PARAM_INT);
        return $stmt->execute();
    } catch (PDOException $e) {
        error_log("Error incrementing question count: " . $e->getMessage());
        return false;
    }
}

/**
 * Decrement question count for a module
 * Called after deleting a question
 */
function decrementModuleQuestionCount($pdo, $modules_id) {
    try {
        $sql = "UPDATE modules SET questions_count = GREATEST(questions_count - 1, 0) WHERE modules_id = :modules_id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':modules_id', $modules_id, PDO::PARAM_INT);
        return $stmt->execute();
    } catch (PDOException $e) {
        error_log("Error decrementing question count: " . $e->getMessage());
        return false;
    }
}

/**
 * Update question counts when moving a question to a different module
 * Called after updating a question's module_id
 */
function updateModuleQuestionCounts($pdo, $old_modules_id, $new_modules_id) {
    try {
        if ($old_modules_id != $new_modules_id) {
            decrementModuleQuestionCount($pdo, $old_modules_id);
            incrementModuleQuestionCount($pdo, $new_modules_id);
        }
        return true;
    } catch (Exception $e) {
        error_log("Error updating question counts: " . $e->getMessage());
        return false;
    }
}

