Codeception Debian Package
====================

![apt-get install](https://raw.githubusercontent.com/Vitexus/codeception.deb/master/codeception-install-deb.png "apt-get install php-codeception")

Codeception (https://codeception.com/) Codeception collects and shares best practices and solutions for testing PHP web applications. With a flexible set of included modules tests are easy to write, easy to use and easy to maintain. Codeception encourages developers and QA engineers to concentrate on testing and not on building test suite. 


Installation
------------

For Debian, Ubuntu & friends please use repo:

    wget -O - http://v.s.cz/info@vitexsoftware.cz.gpg.key|sudo apt-key add -
    echo deb http://v.s.cz/ stable main > /etc/apt/sources.list.d/ease.list
    aptitude update
    aptitude install php-codeception


Usage
-----

simply run **codecept** in /usr/bin

Build
-----

To build package simply run deb-package.sh
(cli/php.ini:  phar.readonly = Off)



Happy coding!
