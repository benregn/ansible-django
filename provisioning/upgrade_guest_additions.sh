CURRENT_VERSION='4.3.0'
wget -c http://download.virtualbox.org/virtualbox/$CURRENT_VERSION/VBoxGuestAdditions_$CURRENT_VERSION.iso
sudo umount /mnt
sudo mount VBoxGuestAdditions_$CURRENT_VERSION.iso -o loop /mnt # replace with correct version
sudo apt-get update
sudo apt-get install -y dkms
sudo apt-get install -y linux-headers-$(uname -r)
sudo sh /mnt/VBoxLinuxAdditions.run

echo -e '\n\n=== ATTENTION! ==='
echo 'it is expected that installing the Window System Drivers will fail'
