clear
echo "Bởi @chamhoi72 trong telegram"
sleep 3 &>/dev/null &
clear
sudo apt update
sudo apt install qemu-kvm -y
read -p "Nhập liên kết tải iso: " $link
wget --no-check-certificate "$link" -O windows.iso
wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
tar -xf ngrok.tgz
rm -rf ngrok.tgz
read -p "Nhập token ngrok"
./ngrok authtoken $token
./ngrok tcp 5900 &>/dev/null &
echo "Lưu ý,chữ G hãy viết hoa"
read -p "Nhập dung lượng: "
qemu-img create -f raw windows $gb
echo "Tạo thành công"
echo ip ngrok:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Copy địa chỉ dán vô vnc"
sudo qemu-system-x86_64 -m 4000M -cpu host -boot order=c -drive file=windows.iso,media=cdrom -drive file=windows.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vga virtio -device virtio-gpu-pci -device intel-hda -device hda-duplex -device rtl8139 -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm