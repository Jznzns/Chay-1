echo "Dang chay"
echo "Ban quyen boi hoang vps link telegram"
echo "https://t.me/chamhoi72"
echo "Bat dau"
echo "3"
echo "2"
echo "1"
echo "let go"
sudo su
sudo apt update
sudo apt install qemu-kvm
read -p "Nhap dung luong,VD:128G" CRP
qemu-img create -f raw win.img $CRP
echo "hay vo nhanh vnc nhanh va an nut bat ky de boot"
sudo qemu-system-x86_64 -m 8G -cpu host -boot order=c -drive file=win.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
