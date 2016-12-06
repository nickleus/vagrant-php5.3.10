# vagrant-php5.3.10

A Vagrant Box for PHP 5.3.10 on Ubuntu 12.04 LTS.

_"precise64"_:
http://releases.ubuntu.com/12.04/

This includes phpMyAdmin as well.

It also sets php error reporting to only show errors, instead of everything.

_install.sh_:

`sudo sed -i "s/error_reporting = .*/error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR/" /etc/php5/apache2/php.ini`

I've also removed installation of Composer n IonCube--keeping it simple.

nickleus
