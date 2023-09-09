echo "Dang update"
sudo apt update
echo "Dang update"
sudo apt install qemu-kvm
echo "chọn dung luong"
read -p "Nhap dung luong,VD:128G(nhap xong hay vo nhanh): " CRP
qemu-img create -f raw windows.img $CRP
echo "hay vo nhanh vnc nhanh va an nut bat ky de boot"
sudo qemu-system-x86_64 -m 8G -cpu host -boot order=c -drive file=windows.iso,media=cdrom -drive file=windows.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
