#!/bin/sh -e

VERSION=$2
TAR=../stringtemplate_$VERSION.orig.tar.xz
DIR=stringtemplate-$VERSION

tar -x -z -f $TAR
XZ_OPT=--best tar -c -J -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir && echo "moved $TAR to $origDir"
fi
