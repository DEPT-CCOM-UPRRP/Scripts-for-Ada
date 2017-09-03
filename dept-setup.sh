#!/bin/sh

# New Xubuntu 16.04.3 LTS
# Software Setup Install

{
# Create user
useradd -m -U -s /bin/bash -p '' student

# Copy Folder
cp /media/ccom-admin/*/143 /home/student/Desktop/

#--------------------------------------------------------------------------------------------
# Qt-creator 5 install
# Ref: https://wiki.qt.io/Install_Qt_5_on_Ubuntu

# Online option for Qt 5.9
# wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run

chmod +x /home/student/Desktop/143/qt-opensource-linux-x64-5.9.1.run;
./qt-opensource-linux-x64-5.9.1.run;
apt install -y build-essential libfontconfig1 mesa-common-dev libglu1-mesa-dev -y;

# Set file association
echo "[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Name=QtCreator
Comment=QtCreator
NoDsiplay=true
Exec=(Install folder of QT)/Tools/QtCreator/bin/qtcreator %f
Icon=(Install folder of QT)/5.9/Src/qtdoc/doc/images/landing/icon_QtCreator_78x78px.png
Name[en_US]=Qt-Creator" >> ~/.local/share/applications/Qt-Creator.desktop;


# Add to defaults list
# if grep -Fxq "text/qtcreator=Qt-Creator.desktop;" /home/student/.local/share/applications/defaults.list
# then
#     # code if found
# 	echo "Already here"
# else
#     # code if not found
# 	echo "text/qtcreator=Qt-Creator.desktop;" >> /home/student/.local/share/applications/defaults.list
# fi

# Hardcoded
echo "text/qtcreator=Qt-Creator.desktop;" >> /home/student/.local/share/applications/defaults.list

# Add to mime db
echo "[added Associations]
application/vnd.nokia.qt.qmakeprofile=qtcreator.desktop" >> mimeapps.list;
update-mime-database /usr/share/mime;
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Sublime text 3 install

# From deb:
apt install -y /home/student/Desktop/143/sublime-text_build-3126_amd64.deb

# From source:
# tar vxjf /home/student/Desktop/143/sublime_text_3_build_3126_x64.tar.bz2;
# mv sublime_text_3 /opt/;su
# ln -sv /opt/sublime_text_3/sublime_text /usr/bin/sublime;
# alias sublime='subl';

# echo "[Desktop Entry]
# Version=1.0
# Name=Sublime Text 3
# # Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
# # From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
# GenericName=Text Editor

# Exec=sublime
# Terminal=false
# Icon=/opt/sublime_text_3/Icon/48x48/sublime_text.png
# Type=Application
# Categories=TextEditor;IDE;Development
# X-Ayatana-Desktop-Shortcuts=NewWindow

# [NewWindow Shortcut Group]
# Name=New Window
# Exec=sublime -n
# TargetEnvironment=Unity" >> /usr/share/applications/sublime.desktop;

# From net:
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
# echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
# apt update
# apt install sublime-text

#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Java Install

# From deb:
apt install -y /home/student/Desktop/143/openjdk-9-jdk_9~b114-0ubuntu1_amd64.deb /home/student/Desktop/143/openjdk-9-jre_9~b114-0ubuntu1_amd64.deb

# From source:
# tar xvf /home/student/Desktop/143/jre-8u121-linux-x64.tar.gz
# mkdir -p /usr/lib/jvm
# mv jre1.8* /usr/lib/jvm/java-8-oracle
# sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/jre/bin/java 1091
# sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-oracle/bin/javac 1091

# Set Java enviroment
# export J2SDKDIR=/usr/lib/jvm/java-8-oracle
# export J2REDIR=/usr/lib/jvm/java-8-oracle/jre
# export PATH=$PATH:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin
# export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# export DERBY_HOME=/usr/lib/jvm/java-8-oracle/db
# source /etc/profile.d/jdk.sh

# Check version
#java -verison
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Anaconda
bash /home/student/Desktop/143/Anaconda3-4.4.0-Linux-x86_64.sh

export PATH=$PATH:~/opt/anaconda3/bin/
# conda create -n py3k python=3 anaconda
# source activate py3k

# Install as user? ENTER
# License agree? yes
# Path? /opt/anaconda3
# Add path to bash? yes
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# R / R Studio
apt install -y /home/student/Desktop/143/r-base-core_3.4.1-2xenial0_amd64.deb
apt install -y /home/student/Desktop/143/r-recommended_3.4.1-2xenial0_all.deb
apt install -y /home/student/Desktop/143/r-doc-html_3.4.1-2xenial0_all.deb
apt install -y /home/student/Desktop/143/r-base-html_3.4.1-2xenial0_all.deb
apt install -y /home/student/Desktop/143/r-base_3.4.1-2xenial0_all.deb
apt install -y /home/student/Desktop/143/rstudio-xenial-1.0.153-amd64.deb

# From source:
# tar xvf /home/student/Desktop/143/rstudio-1.0.136-amd64-debian.tar.gz
# mv /home/student/Desktop/143/cmake-3.7.2-Linux-x86_64.sh /opt/
# bash /opt/cmake-3.7.2-Linux-x86_64.sh
# tar xvf /home/student/Desktop/143/cmake-3.7.2-Linux-x86_64.tar.gz
# cd cmake-3.7.2-Linux-x86_64/
# ./configure --prefix=/opt/cmake
# make
# make install
# /opt/cmake/bin/cmake -version
# alias cmake='/opt/cmake/bin/cmake'
# cd /home/student/Desktop/143/rstudio-1.0.136
# cmake .. -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release
# make install
# cd /home/student/Desktop/143

#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Interpretador de Python 3
# sudo apt install python3
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# gcc/g++ Install
# Already done by Qt Creator
# apt install build-essential
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Install Dr. Racket
bash /home/student/Desktop/143/racket-6.10-x86_64-linux.sh
apt install -y racket_6.10-1_amd64.deb

# yes
# 1
# ENTER
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# smlnj Install
# 	ml-lpt
# 	ml-lex
# 	ml-yacc

apt install -y gcc-multilib g++-multilib lib32z1
apt install -y /home/student/Desktop/143/*sml*.deb

# From source:
# mkdir /usr/local/sml
# mv /home/student/Desktop/143/config.tgz /usr/local/sml
# cd /usr/local/sml
# tar xzvf /usr/local/sml/config.tgz
# cd /home/student/Desktop/143
# rm /usr/local/sml/config.tgz
# bash /usr/local/sml/config/install.sh

#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Latex y algun editor como TexMaker install
apt install -y /home/student/Desktop/143/texmaker_ubuntu_16.04_4.5_amd64.deb
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Jupyter Install
# pip3 install --upgrade pip
# pip3 install jupyter
jupyter notebook
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Spyder
# pip install wheel
# python wheel install spyder-3.1.2-py3-none-any.whl
# pip install --upgrade pip
# pip install /home/student/Desktop/143/spyder-3.1.2-py3-none-any.whl
apt install -y /home/student/Desktop/143/python3-spyder_3.1.3+dfsg1-3_all.deb
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Nand 2 tetris
unzip /home/student/Desktop/143/nand2tetris.zip -d /home/student/Documents
chown -R student:student /home/student/Documents/nand2tetris
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Tmux 2.1
apt install -y /home/student/Desktop/143/tmux_2.1-3build1_amd64.deb
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Ascii 3.15
apt install -y /home/student/Desktop/143/ascii_3.15-1_amd64.deb
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Bless 0.6.0
apt install -y /home/student/Desktop/143/bless_0.6.0-5_all.deb
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Open CV 3.3
# From: https://github.com/menpo/conda-opencv3
conda install conda-build
# git clone https://github.com/menpo/conda-opencv3
unzip opencv-3.3.0.zip
unzip conda-opencv3-master.zip
cd conda-opencv3-master
# To update/replace the line of the file
# sed -i "s/DWITH_FFMPEG=0/DWITH_FFMPEG=1/" build.sh
conda config --add channels menpo
conda build conda/
conda install /PATH/TO/OPENCV3/PACKAGE.tar.gz

# return to ~/Desktop/143
cd ..

# From http://opencv.org/releases.html

# installing requirements
# apt install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# Following this guide: http://docs.opencv.org/trunk/d7/d9f/tutorial_linux_install.html

# unzip opencv-3.3.0
# cd ~/opencv
# mkdir build
# cd build

# Must configure make options
# cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..

# PYTHON2(3)_EXECUTABLE = <path to python>
# PYTHON_INCLUDE_DIR = /usr/include/python<version>
# PYTHON_INCLUDE_DIR2 = /usr/include/x86_64-linux-gnu/python<version>
# PYTHON_LIBRARY = /usr/lib/x86_64-linux-gnu/libpython<version>.so
# PYTHON2(3)_NUMPY_INCLUDE_DIRS = /usr/lib/python<version>/dist-packages/numpy/core/include/

# make -j7 # runs 7 jobs in parallel
# sudo make install
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Virtual Box 5.1
apt install -y /home/student/Desktop/143/virtualbox-5.1_5.1.26-117224~Ubuntu~xenial_amd64.deb

# Add extension pack
vboxmanage extpack install /home/student/Desktop/143/Oracle_VM_VirtualBox_Extension_Pack-5.1.26-117224.vbox-extpack

# Create NAT
VBoxManage natnetwork add --netname MetaNet --network "10.0.2.0/24" --enable --dhcp on

# Awesome resource: https://www.howopensource.com/2011/06/how-to-use-virtualbox-in-terminal-commandline/

#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Make Virtual Machine file directory
mkdir /home/student/Documents/VM-imgs
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Kali Install
# Old kali source
# http://ccom.uprrp.edu/~jortiz/cyber/vms/ccom4088-kali-v20162701.tar.gz
# tar xvf /home/student/Desktop/143/ccom4088-kali-v20162701.tar.gz -C /home/student/Documents/VM-imgs
# VMPath='/home/student/Documents/VM-imgs/ccom4088-kali-v20162701'

# Consider updating to new version
# http://ccom.uprrp.edu/~jortiz/cyber/hscamp/atackpr-camp2017.tar.gz
tar xvf /home/student/Desktop/143/atackpr-camp2017.tar.gz -C /home/student/Documents/VM-imgs
VMPath='/home/student/Documents/VM-imgs/atackpr-camp2017.vmdk'

# Create VM
VM='kali'
DESC="Virtual Machine containing a custom version of kali with some excersices for class"

# VBoxManage convertfromraw --format vmdk --variant Standard $VMPath.vmdk $VMPath.vdi
VBoxManage createvm --name $VM --ostype Debian_64 --basefolder /home/student/VirtualBox\ VMs/ --register
VBoxManage storagectl $VM --name SATA --add sata --controller IntelAhci --bootable on
VBoxManage storageattach $VM --storagectl SATA --port 0 --device 0 --type hdd --medium $VMPath

# Resource Configuration
# VM Description
VBoxManage modifyvm $VM --Description $DESC

# Mother Board
vboxmanage modifyvm $VM --acpi on --ioapic on --vtxux on --chipset piix3

# Proccesor, Memory and
vboxmanage modifyvm $VM --memory 2048 --cpus 2

# Video
vboxmanage modifyvm $VM --vram 128 --accelerate3d on

# Audio
vboxmanage modifyvm $VM --audio alsa --audiocontroller ac97

# Clipboard and File
vboxmanage modifyvm $VM --clipboard bidirectional --draganddrop bidirectional

# Usb and keyboard
vboxmanage modifyvm $VM --usb on --mouse ps2 --keyboard ps2

# Connect to nat
VBoxManage modifyvm $VM --cableconnected2 on --nic2 natnetwork --nat-network MetaNet

#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Metasploitable
# unzip /home/student/Desktop/143/Metasploitable.vmdk.zip -d /home/student/Documents/VM-imgs
# VMPath='/home/student/Documents/VM-imgs/Metasploitable.vmdk'


# Consider using new 2017 Metasploitable vmdk
# # source http://ccom.uprrp.edu/~jortiz/cyber/hscamp/atackpr-camp-ms-2017.tar.gz
# tar xvf /home/student/Desktop/143/atackpr-camp-ms-2017.tar.gz -C /home/student/Documents/VM-imgs
VMPath='/home/student/Documents/VM-imgs/atackpr-camp-ms-2017.vmdk'

# Create vm
VM='Metasploitable'

DESC="Virtual Machine containing a custom version of Metasploitable vm with some excersices for class"

# VBoxManage convertfromraw --format vmdk --variant Standard $VMPath.vmdk $VMPath.vdi
VBoxManage createvm --name $VM --ostype Linux_64 --basefolder /home/student/VirtualBox\ VMs/ --register
VBoxManage storagectl $VM --name SATA --add sata --controller IntelAhci --bootable on
VBoxManage storageattach $VM --storagectl SATA --port 0 --device 0 --type hdd --medium $VMPath

# Resource Configuration
# VM Description
VBoxManage modifyvm $VM --Description $DESC

# Mother Board
vboxmanage modifyvm $VM --acpi on --ioapic on --vtxux on --chipset piix3

# Proccesor, Memory and
vboxmanage modifyvm $VM --memory 2048 --cpus 2

# Video
vboxmanage modifyvm $VM --vram 128 --accelerate3d on

# Audio
vboxmanage modifyvm $VM --audio alsa --audiocontroller ac97

# Clipboard and File
vboxmanage modifyvm $VM --clipboard bidirectional --draganddrop bidirectional

# Usb and keyboard
vboxmanage modifyvm $VM --usb on --mouse ps2 --keyboard ps2

# Connect to nat
VBoxManage modifyvm $VM --cableconnected2 on --nic2 natnetwork --nat-network MetaNet

#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# BioVagrant
unzip /home/student/Desktop/143/biovagrant.ova -d /home/student/Documents/VM-imgs/
VMPath="/home/student/Documents/VM-imgs/biovagrant.ova"
VM="BioVagrant"
DESC="Virtual machine containing a version of BioVagrant"

VBoxManage import $VMPath
VBoxManage modifyvm $VM --Description $DESC
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# eip-intro Install

# http://ccom.uprrp.edu/~rarce/eipgb/chapters/eip-intro/index.html
# http://eip.ccom.uprrp.edu/vms/eip-ubuntu-qt.tar.gz
tar xvf /home/student/Desktop/143/eip-ubuntu-qt.tar.gz -C /home/student/Documents/VM-imgs
VMPath='/home/student/Documents/VM-imgs/eip-ubuntu-qt.vmdk'

# Create vm
VM='EIP-Labs'

DESC="Virtual Machine containing a EIP-Labs excercises for class"

# VBoxManage convertfromraw --format vmdk --variant Standard $VMPath.vmdk $VMPath.vdi
VBoxManage createvm --name $VM --ostype Ubuntu_64 --basefolder /home/student/VirtualBox\ VMs/ --register
VBoxManage storagectl $VM --name SATA --add sata --controller IntelAhci --bootable on
VBoxManage storageattach $VM --storagectl SATA --port 0 --device 0 --type hdd --medium $VMPath

# Resource Configuration
# VM Description
VBoxManage modifyvm --Description $DESC

# Mother Board
vboxmanage modifyvm $VM --acpi on --ioapic on --vtxux on --chipset piix3

# Proccesor, Memory and
vboxmanage modifyvm $VM --memory 2048 --cpus 2

# Video
vboxmanage modifyvm $VM --vram 128 --accelerate3d on

# Audio
vboxmanage modifyvm $VM --audio alsa --audiocontroller ac97

# Clipboard and File
vboxmanage modifyvm $VM --clipboard bidirectional --draganddrop bidirectional

# Usb and keyboard
vboxmanage modifyvm $VM --usb on --mouse ps2 --keyboard ps2

#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Change VM Images Permmisions
chown -R student:student /home/student/Documents/VM-imgs/
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Super Update
apt update -y && apt upgrade -y;
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Super Cleanse
apt autoclean -y && apt autoremove -y;
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Experimental clenaup
rm -rf /home/student/Desktop/143
#--------------------------------------------------------------------------------------------
} 2> script_errors.log
