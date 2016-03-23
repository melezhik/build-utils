#!/bin/bash

markdown2pod README.md > README.pod
cp $1 $1.orig
perl -n -e 'print unless /__END__/ ... eof()' $1.orig > $1
( echo __END__; echo; echo '=pod'; echo; echo; cat README.pod ) >> $1
rm -rf $1.orig

