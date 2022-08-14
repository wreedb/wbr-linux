#!/bin/sh

pacman -Syy $(cat pkglist | perl -pe 's|\n| |g') -y

printf "setting locale to america/chicago\n"
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
clear
printf "generating locale\n"
printf "en_US.UTF-8 UTF-8\nen_US ISO-8859-1\n" >> /etc/locale.gen
locale-gen
printf "LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8\n" >> /etc/locale.conf
clear
printf "setting terminus console font\n"
printf "FONT=ter-c18b\nFONT_MAP=8859-1\n" >> /etc/vconsole.conf
sed -i 's|fsck)|fsck consolefont)|g' /etc/mkinitcpio.conf
clear
printf "enter your hostname: "
read hname
printf "$hname\n" >> /etc/hostname
clear
ln -sf /usr/bin/nvim /usr/bin/vim
printf "create your hosts config - your hostname is $hname\n"
sleep 3
nvim /etc/hosts
clear
printf "enabling services...\n"
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable ufw
systemctl enable rsyncd
systemctl enable sddm
systemctl enable dhcpcd
systemctl enable udisks2
clear
printf "fixing permission files\n"
printf "%wheel ALL=(ALL:ALL) ALL\nDefaults !tty_tickets\n" >> /etc/sudoers
printf "permit persist keepenv :wheel" > /etc/doas.conf
clear
printf "generating initramfs\n"
mkinitcpio -P
clear
printf "set root password: \n"
passwd
printf "enter a username: "
read username
useradd -m -G wheel,video $username
printf "set your password\n"
passwd $username
clear
printf "creating grub configuration\n"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=WBRLINUX
grub-mkconfig -o /boot/grub/grub.cfg
clear
printf "all done !\n\n"
