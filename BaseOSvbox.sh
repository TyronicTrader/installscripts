#!/usr/bin/env/bash

sudo apt update
sudo apt upgrade -y

# once finished with the process do min install
sudo apt install -y dkms linux-headers-$(uname -r) build-essential htop bzip2

# Virtualbox additions need to be added to the system from the virtualbox menu
sudo mount /dev/sr0 /media/cdrom
sudo bash /media/cdrom/VBoxLinuxAdditions.run

# NEXT TIME YOU DO THIS THEN CHECK THE /etc/group FILE TO SEE IF THE USER WAS ALREADY ADDED TO THE VBOXSF GROUP AREADY ****************************
# this will allow you to do the virtualbox client addons (might have to change $USER to $(whoami))
sudo usermod -aG vboxsf $USER
# then reboot
# if still having issues then maybe but bad practice-  sudo chown 777 /media/sf_Share


# If you are going to use other repos then you will want to prioritize them for updates and upgrades
# These will be for your normal distro stable releases and updates
echo -e "Package: *\nPin: release a=stable\nPin-Priority: 990\n" | sudo tee -a /etc/apt/preferences
echo -e "Package: *\nPin: release a=stable-security\nPin-Priority: 990\n" | sudo tee -a /etc/apt/preferences
echo -e "Package: *\nPin: release a=stable-updates\nPin-Priority: 990\n" | sudo tee -a /etc/apt/preferences

# This will be for testing repos which will have lower priority than stable and will not overwrite stable unless you specify it to
echo -e "Package: *\nPin: release a=testing\nPin-Priority: 500\n" | sudo tee -a /etc/apt/preferences

# This will be for unstable repos which will have lower priority than testing and will not overwrite anything unless you specify it to
echo -e "Package: *\nPin: release a=unstable\nPin-Priority: 10\n" | sudo tee -a /etc/apt/preferences

# Add the testing and unstable repositories
echo -e "\ndeb http://deb.debian.org/debian testing main\ndeb http://deb.debian.org/debian unstable main\n" | sudo tee -a /etc/apt/sources.list

sudo apt update

# to confirm above priroty changes took ffect do the following command
# https://debian-handbook.info/browse/stable/sect.apt-get.html#sect.apt.priorities
sudo apt policy

# This is a less effective option to setting the default repo
echo -e 'APT::Default-Release "stable";' | sudo tee -a /etc/apt/apt.conf.d/my-default-release

sudo apt upgrade -y

# if you want to do all testing then use the following otherwise leave off the "-t testing" same would apply to unstalbe "-t unstable"
#sudo apt update -t testing
#sudo apt upgrade -t testing -y
#sudo apt update -t unstable
#sudo apt upgrade -t unstable -y

# If you want bash to have VIM bindings    #Don't forget to set your LS Alais in the .bashrc
# echo -e "# set bash motions in VIM \nset -o vi" | tee -a .bashrc

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
