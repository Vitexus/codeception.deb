#!/bin/bash


./fresh.sh

PACKAGE="php-codeception"
VERSION=`cat Codeception/src/Codeception/Codecept.php | grep "const VERSION" | awk -F'"' '{print $2}' | tr -d '\n'`
REVISION=`cat debian/revision | perl -ne 'chomp; print join(".", splice(@{[split/\./,$_]}, 0, -1), map {++$_} pop @{[split/\./,$_]}), "\n";'`
echo Build now version: $VERSION-$REVISION
sleep 2
cd Codeception
CHANGES=`git log -n 1 | tail -n+5`
cd ..

dch -b -v $VERSION-$REVISION --package $PACKAGE $CHANGES

debuild -i -us -uc -b


LASTVERSION=`cat debian/lastversion`
if [ $LASTVERSION == $VERSION  ];
then
    echo $REVISION > debian/revision
else
    echo 0 > debian/revision
    echo $VERSION > debian/lastversion
fi

rm -rf debian/$PACKAGE

cd ..
ls *.deb

#~/bin/publish-deb-packages.sh
