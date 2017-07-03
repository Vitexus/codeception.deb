#!/bin/bash
cp -f box.json Codeception
cd Codeception
#rm -f package/codecept.phar
#php -f bin/build_phar.php 
#bin/build_phar.php 
composer install
rm -f *.phar
curl -LSs https://box-project.github.io/box2/installer.php | php
php box.phar build -vv
cd ..
echo  "phar7.1 tree -f Codeception/codecept-*.phar | less"
