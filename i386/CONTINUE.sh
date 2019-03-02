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

versi="2.0LTS"
codename=batik
de=xfce
dir_project=/home/$(whoami)/XentaOS/pengembangan/i386
dir_root=/home/$(whoami)/XentaOS/pengembangan/i386/root
dir_dvd=/home/$(whoami)/XentaOS/pengembangan/i386/dvd
dir_iso_release=/home/$(whoami)/XentaOS/perilisan/release/i386/
dir_iso_tester=/home/$(whoami)/XentaOS/perilisan/tester/i386/
figlet continue.sh
echo " Xenta Distro Builder"
echo " "
sudo cp /etc/resolv.conf root/etc/
sudo mount --bind /dev/ root/dev
sudo chroot root
mount -t proc none /proc && mount -t sysfs none /sys && mount -t devpts none /dev/pts
export HOME=/root && export LC_ALL=C
