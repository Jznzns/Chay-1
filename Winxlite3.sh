clear
echo "Bản v1.3 đã thêm Winxlite3.sh"
sleep 2 &>/dev/null &
clear
echo "Đây là bản rút gọn"
sleep 2 &>/dev/null &
clear
echo "Được làm bởi @chamhoi72"
sleep 2 &>/dev/null &
clear
echo "Tải bios"
sleep 2 &>/dev/null &
wget -O bios64.bin https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
clear
read -p "Nhập liên kết iso: " iso
wget --no-check-certificate $iso -O windows.iso
clear
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xf ngrok.tgz
rm -rf ngrok.tgz
clear
echo "Đi lấy link token rồi quay lại đây"
read -p "Nhập token ngrok: " token
./ngrok authtoken $token
sleep 3 &>/dev/null &
clear
./ngrok tcp 5900 &>/dev/null &
echo "Chào nhé,đến bước quan trọng rồi đây"
sleep 2 &>/dev/null &
clear
sudo apt update
sudo apt install qemu-kvm -y
sleep 2 &>/dev/null &
clear
read -p "Nhập dung lượng cho ổ cd-rom: " cd_rom
qemu-img create -f raw windows.img $cd_rom
sleep 2 &>/dev/null &
clear
echo "Đã tạo xong thành công"
sleep 3 &>/dev/null &
echo Ip ngrok:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Copy địa chỉ đi"
echo "Dán vô vnc"
echo "thế là bạn đã có vps"
echo "Không được tắt tab"
echo "đã thành công"
sudo qemu-system-x86_64 -m 8G -cpu host -boot order=c -drive file=windows.iso,media=cdrom -drive file=windows.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
