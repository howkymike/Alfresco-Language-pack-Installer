#!/bin/bash
# Script for installing language packs to Alfresco
#
# Troubleshooting: If some Alfresco messages are translated and some not, check you aikau version
# (look into the ${WEBAPPS_PATH}/alfresco/WEB_INF/lib directory)
# and rename whichever directory in the /META-INF/js/aikau/ folder in the share-xxx.jar file to your aikau version
#
# Copyright 2020 howkymike
# Distributed under the Creative Commons Attribution-ShareAlike 3.0 Unported License (CC BY-SA 3.0)
# Thank you Crowdin community for the awesome translations!
# -------

WEBAPPS_PATH="/opt/alfresco/tomcat/webapps"

echo "Choose your language:[sq, am, ar, id, eu, bg, ca, hr, cs, da, en-GB, et, fil, gl, ka, el, kl, ha, hi, hu, is, kab, ko, lo, Iv, It, mk, pcm, oc, ps , fa, pl, pt-PT, sr-CS, si-LK, sk, sl, sv-SE, th, tr, uk, vi, cy, yo]"
read lang

wget -q http://alf-trans.ossportal.org/files/alfresco-${lang}.jar
wget -q http://alf-trans.ossportal.org/files/share-${lang}.jar
if [ ! "$?" -eq "0" ]; then echo "Bad language!"
	exit 2
fi

while true
do
        if [[ ! -d "${WEBAPPS_PATH}/alfresco/WEB-INF/lib" ]]
        then
                sleep 3
        else
                break
        fi
done
cp -pr alfresco-${lang}.jar ${WEBAPPS_PATH}/alfresco/WEB-INF/lib/
echo "alfresco language support compleated!"
while true
do
        if [[ ! -d "${WEBAPPS_PATH}/share/WEB-INF/lib" ]]
        then
                sleep 3
        else
                break
        fi
done
cp -pr share-${lang}.jar ${WEBAPPS_PATH}/share/WEB-INF/lib/
echo "share language support compleated"
echo "Restart your Alresco instance"

