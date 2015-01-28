#!/bin/bash

SOURCE=$1
FILENAME=`basename $SOURCE`
DESTINATION=${HOME}/Downloads/${FILENAME}

cp $SOURCE ${DESTINATION}
/usr/bin/open $DESTINATION
