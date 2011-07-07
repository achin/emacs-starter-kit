#!/bin/sh
/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n "${1}" 2> /dev/null
if [ $? -ne 0 ]; then
   open -a /Applications/Emacs.app "${1}"
fi
