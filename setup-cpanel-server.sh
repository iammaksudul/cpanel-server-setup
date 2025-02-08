#!/bin/bash

# Function to display loading animation
loading_animation() {
    spin='-\|/'
    i=0
    echo -n 'Please wait while the setup is being prepared...'
    while : ; do
        echo -n "${spin:i++%${#spin}:1}"
        sleep .1
        echo -n "\b"
    done
}

# Check if the script is run by root user
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root!"
    exit 1
fi

# 1. Ask for permission to proceed
echo "This script will install and configure a cPanel-based server for shared hosting."
echo "Do you want to proceed with the setup? (yes/no)"
read -r confirm

if [[ ! "$confirm" =~ ^[Yy](es)?$ ]]; then
    echo "Setup aborted."
    exit 0
fi

# 2. Prompt for root password to proceed with the installation
echo "Please enter your root password to continue with the installation:"
su -c "echo Root password accepted. Continuing with the installation."

# 3. Start the setup with loading animation
loading_animation &

# 4. Update the server
echo "Updating the server..."
yum update -y

# 5. Install cPanel & WHM
echo "Installing cPanel & WHM..."
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest

# 6. Install Apache web server
echo "Installing Apache web server..."
yum install -y httpd

# 7. Install MariaDB (Database Server)
echo "Installing MariaDB..."
yum install -y mariadb-server mariadb

# 8. Install PHP (compatible with cPanel)
echo "Installing PHP..."
yum install -y ea-php74 ea-php74-php ea-php74-php-cli

# 9. Install Pure-FTPd for file transfer
echo "Installing Pure-FTPd..."
yum install -y pure-ftpd

# 10. Install ClamAV for antivirus scanning
echo "Installing ClamAV..."
yum install -y clamav clamav-daemon

# 11. Install CSF firewall
echo "Installing CSF firewall..."
yum install -y perl
cd /usr/src
wget https://download.configserver.com/csf.tgz
tar -xvzf csf.tgz
cd csf
sh install.sh

# 12. Configure Apache for optimization
echo "Configuring Apache optimization..."
sed -i 's/KeepAlive Off/KeepAlive On/' /etc/httpd/conf/httpd.conf
echo "KeepAliveTimeout 15" >> /etc/httpd/conf/httpd.conf

# 13. Enable mod_deflate for compression
echo "Enabling mod_deflate..."
sed -i 's/#LoadModule deflate_module/LoadModule deflate_module/' /etc/httpd/conf/httpd.conf

# 14. Enable Brotli compression
echo "Installing Brotli compression..."
yum install -y brotli

# 15. Install and configure AutoSSL for SSL certificates
echo "Configuring SSL (AutoSSL for cPanel)..."
whmapi1 install_ssl

# 16. Restart Apache and MariaDB to apply changes
echo "Restarting Apache and MariaDB..."
systemctl restart httpd
systemctl restart mariadb

# 17. Clean up unnecessary packages
echo "Cleaning up unnecessary packages..."
yum autoremove -y

# Final message
echo "cPanel-based server setup completed successfully!"
echo "Please log in to WHM to complete further configurations at: https://your-server-ip:2087"

# End of script
