apt-get update
echo "Tai xuong iso windows"
wget -O win.iso https://archive.org/download/windows-x-lite-22621.1928-micro-11-by-fbconan/Windows%20X-Lite%20%2822621.1928%29%20%27Micro%2011%27%20By%20FBConan.iso
echo "Tai xuong ngrok"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
tar -xf ngrok.tgz
rm -rf ngrok.tgz
read -p "Nhap Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Downloading File
sudo su
sudo apt update
sudo apt install qemu-kvm -y
qemu-img create -f raw win.img 200G
apt-get install qemu
echo "Doi"
echo "Bat Dau Chay Windows"
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Ctrl+C De Sao Chep"
echo "Doi 1-2p De Cho Chay Xong Bot"
echo "Dung Dong Tab Hay Tat"
sudo qemu-system-x86_64 -m 8G -cpu host -boot order=c -drive file=win.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
sleep 43200
