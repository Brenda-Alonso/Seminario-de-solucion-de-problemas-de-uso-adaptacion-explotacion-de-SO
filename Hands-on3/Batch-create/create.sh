#!/bin/bash

echo "Hola Mundo" > mytext.txt
cat mytext.txt
mkdir backup
mv mytext.txt backup/
ls backup/
rm backup/mytext.txt
rmdir backup
