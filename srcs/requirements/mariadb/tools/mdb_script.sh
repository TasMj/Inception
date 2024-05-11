touch tmp_file
chmod 777 tmp_file

echo "CREATE DATABASE IF NOT EXISTS $MDB_DATABASE;" >> tmp_file
echo "FLUSH PRIVILEGES;" >> tmp_file
echo "GRANT ALL ON *.* TO '$MDB_ROOT'@'localhost' IDENTIFIED BY '$MDB_ROOT_PASSWORD' WITH GRANT OPTION;" >> tmp_file
echo "FLUSH PRIVILEGES;" >> tmp_file
echo "CREATE USER IF NOT EXISTS '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASSWORD';" >> tmp_file
echo "GRANT ALL PRIVILEGES ON $MDB_DATABASE.* TO '$MDB_USER'@'%';"  >> tmp_file
echo "FLUSH PRIVILEGES;" >> tmp_file

mysqld --user=mysql --verbose --bootstrap < tmp_file
rm tmp_file

exec mysqld
