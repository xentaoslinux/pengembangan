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
version_kernel="4.13.0-19"
jahitan=preview
dir_project=/home/project/pengembangan/i386/
dir_root=/home/project/pengembangan/i386/root
dir_dvd=/home/project/pengembangan/i386/dvd
dir_iso_release=/home/project/perilisan/release/i386/
dir_iso_tester=/home/project/perilisan/tester/i386/
figlet makeiso.sh
echo " Xenta Distro Builder"
echo " "
sudo rm -rf dvd/casper/initrd.lz
sudo cp root/boot/initrd.img-$version_kernel-generic dvd/casper/initrd.lz
sudo rm -rf dvd/casper/vmlinuz
sudo cp root/boot/vmlinuz-$version_kernel-generic  dvd/casper/vmlinuz
sudo rm ./dvd/casper/filesystem.squashfs 
sudo chmod +w ./dvd/casper/filesystem.manifest
sudo su
# sudo chroot root dpkg-query -W --showformat='${Package} ${Version}\n' > ./dvd/casper/filesystem.manifest
# printf $(sudo du -sx --block-size=1 root | cut -f1) > ./dvd/casper/filesystem.size
# exit
sudo cp  dvd/casper/filesystem.manifest  dvd/casper/filesystem.manifest-desktop
sudo mksquashfs root dvd/casper/filesystem.squashfs -b 1048576 -comp xz -Xdict-size 100%
cd dvd && sudo rm MD5SUMS
find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee MD5SUMS
cd ..
sudo mkisofs -r -V "xentaos-2.0LTS-xfce-i386" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ./xentaos-2.0LTS-xfce-i386-$jahitan.iso dvd
sudo chmod 777 xentaos-2.0LTS-xfce-i386-$jahitan.iso
isohybrid xentaos-2.0LTS-xfce-i386-$jahitan.iso
md5sum xentaos-2.0LTS-xfce-i386-$jahitan.iso   >   xentaos-2.0LTS-xfce-i386-$jahitan.iso.md5msum
sha1sum xentaos-2.0LTS-xfce-i386-$jahitan.iso  >   xentaos-2.0LTS-xfce-i386-$jahitan.iso.sha1sum
sha3sum xentaos-2.0LTS-xfce-i386-$jahitan.iso  >   xentaos-2.0LTS-xfce-i386-$jahitan.iso.sha3sum
