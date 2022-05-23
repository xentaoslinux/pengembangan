#!/usr/bin/env bash
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# .
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# .
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>

versi="3"
codename=brawijaya
de=cinnamon
dir_project=/home/project/pengembangan/console/
dir_root=/home/project/pengembangan/console/root
dir_dvd=/home/project/pengembangan/console/dvd
dir_iso_release=/home/project/perilisan/release/console/
dir_iso_tester=/home/project/perilisan/tester/console/
figlet make.sh
echo " Xenta Distro Builder"
echo " "
cd /home/project/pengembangan/console/
sudo mkdir dvd root
sudo debootstrap --arch=i386 --variant=minbase bionic /home/project/pengembangan/console/root http://archive.ubuntu.com/ubuntu/
cd dvd
sudo mkdir casper .disk isolinux
sudo cp /usr/lib/syslinux/modules/bios/Idllinux.c32 /home/project/pengembangan/console/dvd/isolinux/
sudo cp /home/project/pengembangan/console/root/boot/memtest86+.bin /home/project/pengembangan/console/dvd/memtest
