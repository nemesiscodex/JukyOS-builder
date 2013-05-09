#!/bin/bash
#Este script agrega la url del servidor de ParaguayEduca para actualizar las actividades 
echo "Agregando URL de actividades de ParaguayEduca"
cp $PWD/misc/juky-updater-source-1.0 $INSTALL_ROOT/home/olpc/Activities/.groups
