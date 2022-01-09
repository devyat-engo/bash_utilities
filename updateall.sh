#!/bin/bash

# This script automates all required for updating and upgrading the system
# This scripts gets added to ~/.bashrc to run creating the alias "updateall"
# Also Autoremoves dependancies not required anymore

echo "
########################
##### UPDATE start #####
########################
"
sudo apt-get update -y
sudo apt install gh
echo "
########################
###### UPDATE end ######
########################
"


echo "
#######################
#### UPGRADE start ####
#######################
"
sudo apt-get upgrade -y
echo "
#######################
##### UPGRADE end #####
#######################
"


echo "
########################
###### DIST start ######
########################
"
sudo apt-get dist-upgrade -y
echo "
########################
####### DIST END #######
########################
"


echo "
########################
### AUTOREMOVE start ###
########################
"
sudo apt-get dist-upgrade -y
echo "
########################
#### AUTOREMOVE END ####
########################
"


