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
de=cinnamon
dir_project=/home/$(whoami)/XentaOS/pengembangan/amd64/
dir_root=/home/$(whoami)/XentaOS/pengembangan/amd64/root
dir_dvd=/home/$(whoami)/XentaOS/pengembangan/amd64/dvd
dir_iso_release=/home/$(whoami)/XentaOS/perilisan/release/amd64/
dir_iso_tester=/home/$(whoami)/XentaOS/perilisan/tester/amd64/
figlet make.sh
echo " Xenta Distro Builder"
echo " "
mkdir dvd deb mnt
sudo mount -o loop ./*.iso mnt
sudo rsync --exclude=/casper/filesystem.squashfs -a ./mnt/ ./dvd
sudo unsquashfs ./mnt/casper/filesystem.squashfs
sudo mv ./squashfs-root ./root
sudo umount ./mnt
