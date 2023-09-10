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
./ngrok tcp 3389 &>/dev/null &
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
qemu-system-x86_64 \
-net nic -net user,hostfwd=tcp::3389-:3389 \
-m 12G -smp cores=4 \
-cpu max \
-enable-kvm \
-boot order=d \
-drive file=windows.img,format=raw,if=virtio \
-device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
-device usb-tablet \
-vnc :0 -vga virtio
