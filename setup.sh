#!/bin/bash

# Change directory to the user's home directory
cd

# Check if the web folder is empty
if [ -z "$(ls -A /home/files/ftp/files/web/*)" ]; then
    echo "FTP folder is empty. No action performed."
else
    # Remove old files in the html folder
    rm -f /var/www/html/web/*

    # Move files from /home/files/ftp/files/web/ to /var/www/html/
    mv /home/files/ftp/files/web/* /var/www/html/

    # Restart nginx service
    systemctl restart nginx

    echo "Files moved successfully and nginx restarted."
fi
