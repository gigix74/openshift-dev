#!/bin/sh
apt update

apt install cpu-checker -y
kvm-ok
apt install qemu-kvm virt-manager virtinst libvirt-clients bridge-utils libvirt-daemon-system dnsmasq -y

sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd
# sudo systemctl status libvirtd

mkdir -p ~/local/bin
cp /shared/provision/crc-linux-2.33.0-amd64/crc ~/local/bin

sudo usermod -aG kvm vagrant
sudo usermod -aG libvirt vagrant

crc config set consent-telemetry no
crc config set network-mode user

crc cleanup
crc setup
