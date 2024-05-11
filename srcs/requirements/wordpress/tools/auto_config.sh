sleep 10

if ! wp core is-installed --allow-root  ; then
    wp core download --allow-root --force
    wp config create --dbname=wordpress --dbuser=$MDB_USER \
    --dbpass=$MDB_PASSWORD --dbhost=mariadb \
    --allow-root --force
    wp core install --url="$DOMAIN_NAME" --title="$SITE_TITLE" \
    --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW \
    --admin_email=$WP_ADMIN_MAIL --allow-root
    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PW --allow-root
    wp config shuffle-salts --allow-root
    echo "Wordpress's installation complete"
fi

if wp core is-installed --allow-root  ; then
    echo "Wordpress is installed and running"
    php-fpm7.4 -F -R
else
    echo "Wordpress's installation failed"
fi
