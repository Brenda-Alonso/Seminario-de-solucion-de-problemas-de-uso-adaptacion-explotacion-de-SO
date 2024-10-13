@echo off
echo Hola Mundo > mytext.txt
echo Contenido de mytext.txt:
type mytext.txt
mkdir backup
copy mytext.txt backup\
echo Listando el contenido del subdirectorio backup:
dir backup
del backup\mytext.txt
rmdir backup
echo Operacion completada.
