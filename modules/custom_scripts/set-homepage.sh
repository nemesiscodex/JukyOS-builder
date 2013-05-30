#!/bin/bash
# configura la pagina de inicio del navegador de sugar 
echo "Instalando el contenido de la pagina de incio"
mkdir -p $INSTALL_ROOT/home/olpc/.library_pages/
cp $PWD/misc/index_sugar/index.html $INSTALL_ROOT/home/olpc/.library_pages/
chmod 777 $INSTALL_ROOT/home/olpc/.library_pages/index.html
rm -rf $INSTALL_ROOT/usr/share/library-common
cp -r $PWD/misc/index_sugar/library-common $INSTALL_ROOT/usr/share/
chmod 777 $INSTALL_ROOT/usr/share/library-common
