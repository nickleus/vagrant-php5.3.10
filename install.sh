#!/usr/bin/env bash

echo "--- Provisioning"

echo "--- Updating packages list"
sudo apt-get update

echo "--- MySQL time"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

echo "--- Installing base packages"
sudo apt-get install -y vim curl python-software-properties

echo "--- Updating packages list"
sudo apt-get update

echo "--- Installing PHP-specific packages"
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-imagick phpmyadmin mysql-server-5.5 php5-mysql git-core

echo "--- Installing and configuring Xdebug"
sudo apt-get install -y php5-xdebug

cat << EOF | sudo tee -a /etc/php5/conf.d/xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = 1
xdebug.cli_color = 1
xdebug.show_local_vars = 1
xdebug.var_display_max_depth = -1
xdebug.var_display_max_children = -1
xdebug.var_display_max_data = -1
EOF

echo "--- Enabling mod-rewrite"
sudo a2enmod rewrite

#echo "--- PHP error config"
sudo sed -i "s/error_reporting = .*/error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR/" /etc/php5/apache2/php.ini
#sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

echo "--- Configure Apache"
sudo sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
sudo sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www/' /etc/apache2/sites-enabled/000-default

echo "--- Set ServerName to localhost for Apache"
cat << EOF | sudo tee /etc/apache2/httpd.conf
ServerName localhost
EOF

echo "--- Add phpmyadmin access for Apache"
cat << EOF | sudo tee -a /etc/apache2/apache2.conf
Include /etc/phpmyadmin/apache.conf
EOF

echo "--- Restarting Apache"
sudo service apache2 restart
