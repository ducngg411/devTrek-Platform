<?php
// Database Configuration
// Supports both local development and Railway deployment

// Railway environment variables (production)
$db_host = getenv('DB_HOST') ?: getenv('MYSQLHOST') ?: 'localhost';
$db_port = getenv('DB_PORT') ?: getenv('MYSQLPORT') ?: '3306';
$db_name = getenv('DB_NAME') ?: getenv('MYSQLDATABASE') ?: 'final_cw';
$db_user = getenv('DB_USER') ?: getenv('MYSQLUSER') ?: 'root';
$db_pass = getenv('DB_PASS') ?: getenv('MYSQLPASSWORD') ?: '';

try {
    $pdo = new PDO("mysql:host=$db_host;port=$db_port;dbname=$db_name;charset=utf8mb4", $db_user, $db_pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Could not connect to the database: " . $e->getMessage());
}

