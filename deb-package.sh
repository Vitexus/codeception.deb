#!/bin/bash


./make-phar.sh

BINARY=`ls codeception/codeception-*.phar`
VERSION=`echo $BINARY | sed -e 's/codeception\/codeception-v//g' | sed -e 's/.phar//g'`
echo version: $VERSION
mv $BINARY codeception/codeception

PACKAGE="php-codeception"
REVISION=`cat debian/revison | perl -ne 'chomp; print join(".", splice(@{[split/\./,$_]}, 0, -1), map {++$_} pop @{[split/\./,$_]}), "\n";'`

cd codeception
CHANGES=`git log -n 1 | tail -n+5`
cd ..

dch -b -v $VERSION-$REVISION --package $PACKAGE $CHANGES

debuild -i -us -uc -b


LASTVERSION=`cat debian/lastversion`
if [ $LASTVERSION == $VERSION  ];
then
    echo $REVISION > debian/revison
else
    echo 0 > debian/revison
    echo $VERSION > debian/lastversion
fi

rm -rf debian/$PACKAGE

cd ..
ls *.deb

#~/bin/publish-deb-packages.sh
