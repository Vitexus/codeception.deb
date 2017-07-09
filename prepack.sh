#!/bin/bash
mkdir -p debian/php-codeception/usr/bin
cp -f Codeception/codecept-*.phar debian/php-codeception/usr/bin/codecept
chmod +x debian/php-codeception/usr/bin/codecept
mkdir -p debian/php-codeception/usr/share/php
cp -rf Codeception/src/* debian/php-codeception/usr/share/php
chmod -x debian/php-codeception/usr/share/php/Codeception/Lib/Driver/Db.php

