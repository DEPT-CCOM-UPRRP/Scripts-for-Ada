#!/bin/sh

# New Xubuntu 16.04.3 LTS 
# Software Setup Install

# Copy Folder
# cp /media/student/B9ED-7B09/143 ~/Desktop

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
# Virtual Box 5.1
apt install -y /home/student/Desktop/143/virtualbox-5.1_5.1.26-117224~Ubuntu~xenial_amd64.deb

# Add extension pack
vboxmanage extpack install /home/student/Desktop/143/Oracle_VM_VirtualBox_Extension_Pack-5.1.26-117224.vbox-extpack
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
# sudo apt-get install python3
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# gcc/g++ Install 
# Already done by Qt Creator
# apt-get install build-essential
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

apt-get install -y gcc-multilib g++-multilib lib32z1
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
# Kali Install
# http://ccom.uprrp.edu/~jortiz/cyber/vms/ccom4088-kali-v20162701.tar.gz
mkdir /home/student/Documents/VM-imgs
mv /home/student/Desktop/143/ccom4088-kali-v20162701.tar.gz /home/student/Documents/VM-imgs
cd /home/student/Documents/VM-imgs
tar xvf /home/student/Documents/VM-imgs/ccom4088-kali-v20162701.tar.gz
rm /home/student/Documents/VM-imgs/ccom4088-kali-v20162701.tar.gz
cd /home/student/Desktop/143
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# BioVagrant
 mv /home/student/Desktop/143/biovagrant.ova /home/student/Documents/VM-imgs
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# Change VM Images Permmisions
chown -R student:student /home/student/Documents/VM-imgs/
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
