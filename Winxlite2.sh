echo "Đang tải"
sudo apt update
echo "Đang tải"
sudo apt install qemu-kvm
echo "Nên nhập 128G trở xuống(nhưng có thể tự chọn như 100000G"
read -p "Nhập dung lượng để xài,VD:128G(nhập xong vô nhanh): " CRP
qemu-img create -f raw windows.img $CRP
echo "hãy vô vnc và ấn nút bất kỳ để boot"
echo "bạn đã có thể thưởng thức 1 con vps miễn phí với 1h hoặc hơn để sử dụng như đào coi và vv"
sudo qemu-system-x86_64 -m 8G -cpu host -boot order=c -drive file=windows.iso,media=cdrom -drive file=windows.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
