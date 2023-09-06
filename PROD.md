error: Cant read php? 

solution: add this line to apache2.conf
->      <FilesMatch "^\.php">
            SetHandler application/x-httpd.php
        </FilesMatch>

error: Cache unable to write to "/var/www/html/writable/cache/"

solution: 
-> docker ps
-> docker exec -it container_name sh
-> cd ../../../
-> chown -R www-data:www-data /var/www/html/writable/cache/

error: Session: Configured save path "/var/www/html/writable/session" is not writable by the PHP process.

-> ls -l /var/www/html/writable/session
-> chown -R www-data:www-data /var/www/html/writable/session
-> chmod -R 770 /var/www/html/writable/session

error: Unable to connect to the database. Main connection [MySQLi]: php_network_getaddresses: getaddrinfo for mysql-db-1 failed: Temporary failure in name resolution

-> docker ps
-> docker network connect mysql_default container_name