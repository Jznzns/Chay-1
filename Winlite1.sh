clear
echo "Bởi @chamhoi72 ở telegram"
sleep 2 &>/dev/null &
clear
apt update
apt install qemu-kvm -y
qemu-img create -f raw windows.img 20G
sleep 2 &>/dev/null &
clear
read -p "Nhập link gz để tải gz: " gz
wget -O windows.img $gz
sleep 2 &>/dev/null &
clear
echo "Tải ngrok"
sleep 2 &>/dev/null &
read -p "Nhập link file Gz: " gz && wget -O- --no-check-certificate "$gz" | gunzip | dd of=windows.img
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
sudo apt update
sudo apt install ngrok -y
read -p "Nhập token: " token
ngrok authtoken $token
sleep 2 &>/dev/null &
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
read -p "Nhập vùng: " region
./ngrok tcp --region $region 3388 &>/dev/null &
clear
echo "Hí nhô"
sleep 1 &>/dev/null &
clear
echo "Chờ chút"
sleep 1 &>/dev/null &
echo "Windows đã sẵn sàng"
sleep 1 &>/dev/null &
echo Ip của vps:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Copy địa chỉ đi"
echo "Đợi 1-2p để bot hoàn thành"
echo "Không được đóng tab cửa sổ"
echo "Cảm ơn đã tin tưởng tôi"
sudo qemu-system-x86_64 -hda windows.img -m 8G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic
sleep 43200
