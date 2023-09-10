clear
echo "Bản v1.3 đã thêm Winxlite3.sh"
sleep 2
clear
echo "Đây là bản rút gọn"
sleep 2
clear
echo "Được làm bởi @chamhoi72"
sleep 2
clear
echo "Tải bios"
sleep 1
wget -O bios64.bin https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
clear
read -p "Nhập liên kết iso: " iso
wget -O windows.iso $iso
clear
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
unzip ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xf ngrok.tgz
rm -rf ngrok.tgz
clear
echo "Đi lấy link token rồi quay lại đây" ip
read -p "Nhập token: " $ip
./ngrok authtoken $ip
sleep 3 &>/dev/null &
clear
echo "
- us: Hoa Kỳ (United States)
- eu: Châu Âu (Europe)
- ap: Châu Á - Thái Bình Dương (Asia/Pacific)
- au: Úc (Australia)
- sa: Nam Mỹ (South America)
- jp: Nhật Bản (Japan)
- in: Ấn Độ (India)
- kh: Campuchia
- sg: Singapore
- cn: China
- ph: Philippines
- la: Laos
- ngrok.io: Vùng mặc định"
read -p "Nhập vùng cho vps: " region
nohup ./ngrok tcp -region $region 5900 &>/dev/null &
echo "Chào nhé,đến bước quan trọng rồi đây"
sleep 2 &>/dev/null &
clear
sudo apt update
sudo apt install qemu-kvm -y
read -p "Nhập dung lượng cho ổ cd-rom: " cd_rom
qemu-img create -f raw windows.img $cd_rom
sleep 1 &>/dev/null &
clear
echo "Đã tạo xong thành công"
sleep 3 &>/dev/null &
echo Ip của vps:
netstat -tn | grep ":5900" | awk '{print $5}' | cut -d: -f1
echo "Copy địa chỉ đi"
echo "Dán vô vnc"
echo "thế là bạn đã có vps"
echo "Không được tắt tab"
echo "đã thành công"
sudo qemu-system-x86_64 -m 8G -cpu host -boot order=c -drive file=windows.iso,media=cdrom -drive file=windows.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
