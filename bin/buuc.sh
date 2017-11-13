#!/bin/bash

echo ""
echo ">>> `date`"
echo ""

/usr/local/bin/brew update
/usr/local/bin/brew upgrade
/usr/local/bin/brew cleanup
