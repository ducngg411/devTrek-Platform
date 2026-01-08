<?php
// Database Configuration
// For InfinityFree, update these values with your hosting credentials
$db_host = 'localhost';           // InfinityFree: sqlXXX.infinityfreeapp.com
$db_name = 'final_cw';           // InfinityFree: epizXXXXX_database_name
$db_user = 'root';               // InfinityFree: epizXXXXX_username
$db_pass = '';                   // InfinityFree: your_database_password

try {
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name;charset=utf8mb4", $db_user, $db_pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Could not connect to the database: " . $e->getMessage());
}

