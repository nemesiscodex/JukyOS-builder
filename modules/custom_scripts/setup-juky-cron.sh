#!/bin/bash
echo "Instalando Juky-Cron"
#echo "Creando directorio .log"
#mkdir /home/olpc/.log
cp $PWD/misc/juky-cron $INSTALL_ROOT/usr/sbin/
ln -s $INSTALL_ROOT/usr/sbin/juky-cron $INSTALL_ROOT/etc/cron.daily/
echo "#juky update cron repo conf" > $INSTALL_ROOT/home/olpc/.juky-updater
echo "#JUKY_REPO=" >> $INSTALL_ROOT/home/olpc/.juky-updater
