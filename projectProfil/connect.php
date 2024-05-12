<?php
$dbHost = 'mydb-service'; // Remplacez par votre h  te de base de donnes
$dbName = 'profil_infos'; // Remplacez par le nom de votre base de donnes
$dbUser = 'root'; // Remplacez par le nom d'utilisateur de la base de donnes
$dbPass = 'redhat'; // Remplacez par le mot de passe de la base de donnes

try {
    $db = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
    
} catch (PDOException $e) {
    echo "Erreur de connexion à la base de données : " . $e->getMessage();
}
?>
