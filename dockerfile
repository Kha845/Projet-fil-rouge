#Dans ce fichier on configure un environnement PHP 8.2 avec Apache et quelques extensions activées.

#spécifie l'image de base à utiliser, qui est PHP 8.2 avec le serveur Apache installé.
FROM php:8.2-apache



#Cette ligne met à jour les listes de paquets pour les mises à jour et installe les mises à jour nécessaires.
# Le drapeau -y est utilisé pour répondre automatiquement oui à toute demande de confirmation.
RUN apt-get update && apt-get upgrade -y

#Cette ligne installe les extensions PHP nécessaires à la connectivité avec la base de données. Plus précisément, 
#elle installe les extensions MySQL pour PHP : mysqli (MySQL Improved) et pdo_mysql (driver PHP Data Objects pour MySQL).
#et active les extensions PHP installées.
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo_mysql

#Cette ligne expose le port 80, le port par défaut pour le trafic HTTP, 
#permettant aux connexions externes d'atteindre le serveur Apache s'exécutant à l'intérieur du conteneur.
EXPOSE 80
