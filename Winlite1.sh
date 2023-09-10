clear
echo "Bởi @chamhoi72 ở telegram"
apt-get update
sleep 1 &>/dev/null &
clear
read -p "Nhập link gz để tải gz: " gz
wget -O windows.img $gz
sleep 1 &>/dev/null &
clear
echo "Tải ngrok"
sleep 1 &>/dev/null &
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Nhập token: " token
./ngrok authtoken $token
sleep 1 &>/dev/null &
clear
echo "Chọn vùng cho vps"
sleep 3 &>/dev/null &
clear
echo "- us: Hoa Kỳ (United States)
- eu: Châu Âu (Europe)
- ap: Châu Á - Thái Bình Dương (Asia/Pacific)
- au: Úc (Australia)
- sa: Nam Mỹ (South America)
- jp: Nhật Bản (Japan)
- in: Ấn Độ (India)
- ngrok.io: Vùng mặc định"
read -p "Nhập vùng: " region
nohup ./ngrok tcp -region $region 5900 &>/dev/null &
echo "Hí nhô"
sleep 1 &>/dev/null &
clear
apt-get install qemu
echo "Chờ chút"
sleep 1 &>/dev/null &
echo "Windows đã săn sàng"
sleep 1 &>/dev/null &
echo Ip của vps:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Copy địa chỉ đi"
echo "Đợi 1-2p để bot hoàn thành"
echo "Không được đóng tab cửa sổ"
echo "Cảm ơn đã tin tưởng tôi"
qemu-system-x86_64 -hda w7x64.img -m 8G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic
sleep 43200
