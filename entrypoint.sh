#!/bin/bash
set -e

# Path where WordPress should live
WP_PATH="/var/www/html"

# Check if directory is empty
if [ -z "$(ls -A $WP_PATH)" ]; then
    echo "WordPress directory empty, downloading 6.8.2 WordPress..."
    curl -O https://wordpress.org/wordpress-6.8.2.zip
    tar -xzf latest.tar.gz --strip-components=1
    rm latest.tar.gz
    chown -R www-data:www-data $WP_PATH
    echo "WordPress downloaded successfully."
else
    echo "WordPress already exists, skipping download."
fi

# Execute the container's main command (php-fpm)
exec "$@"
