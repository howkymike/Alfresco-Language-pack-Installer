# Alfresco-Language-pack-Installer
Script which installs chosen language to the Alfresco instance (works with Alfresco 6.x)

## Usage
1) download script `wget https://raw.githubusercontent.com/howkymike/Alfresco-Language-pack-Installer/master/installLanguage.sh`
2) change **WEBAPPS_PATH** in the script
3) Execute script `./installLanguage.sh`
4) Pick your language
5) Wait until script finish
6) Restart your Alfresco instance
7) Congratulations! You have new language installed!

##  Important
You have to run this script everytime you upload new war files (i.e. when you upload new apm files) 

## Troubleshooting
If some Alfresco messages are translated and some not, check you Aikau version
(look into the **${WEBAPPS_PATH}/alfresco/WEB_INF/lib** directory)
and rename whichever directory in the **/META-INF/js/aikau/** folder in the share-xxx.jar file to your aikau version

### ---
Script uses translations which are avaible on [this](http://alf-trans.ossportal.org/) site. Thank you Crowdin community!
