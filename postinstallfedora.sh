#! /bin/bash

echo "Running hardware firmware updates"
fwupdmgr get-devices
fwupdmgr refresh --force
fwupdmgr get-updates
fwupdmgr update

mkdir -p /usr/share/fonts

echo "Install Media codecs"
dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf groupupdate sound-and-video
dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
dnf install lame\* --exclude=lame-devel
dnf group upgrade --with-optional Multimedia
dnf install ffmpeg ffmpeg-libs libva libva-utils

echo "Changing hostname"
hostnamectl set-hostname evilqueen

echo "Install grub customizer. Please add mitigations=off"
dnf install grub-customizer



