# vagrant-php5.3.10

**DISCLAIMER! You assume all risk for using this. I make no claims and give no guarantees about the security of this setup.**

A Vagrant Box for PHP 5.3.10 on Ubuntu 12.04 LTS, based on @a-h-abid's version.

APPS

* mysql (_Ver 14.14 Distrib 5.5.53, for debian-linux-gnu (x86_64) using readline 6.2_)
* apache2 (_Apache/2.2.22 (Ubuntu)_)
* php5.3.10 (_PHP 5.3.10-1ubuntu3.25 with Suhosin-Patch (cli) (built: Oct  3 2016 17:02:21), with Xdebug v2.1.0_)
* phpmyadmin (_3.4.10.1deb1_)

NOTES

_"precise64"_:
http://releases.ubuntu.com/12.04/

This includes phpMyAdmin as well.

It also sets php error reporting to only show errors, instead of everything.

_install.sh_:

`sudo sed -i "s/error_reporting = .*/error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR/" /etc/php5/apache2/php.ini`

I've also removed installation of Composer n IonCube--keeping it simple.

nickleus
