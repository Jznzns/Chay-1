apt-get update
echo "dang tai iso windows"
wget -O win.iso https://archive.org/download/windows-x-lite-22621.1928-micro-11-by-fbconan/Windows%20X-Lite%20%2822621.1928%29%20%27Micro%2011%27%20By%20FBConan.iso
echo "tai ngrok"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Downloading File From akuh.net
apt-get install qemu-system-x86 -y
echo "Wait"
echo "Starting Windows"
qemu-system-x86_64 -hda win.img -m 8G -smp cores=4 -net user,hostfwd=tcp::5900-:5900 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo
echo
echo "===================================="
echo "===================================="
echo "treo tab de vps chay, thank you"
echo "ban da nhan vps free"
echo "cho 2p de bot chay"
echo "khong duoc tat tab"
echo "vps chay duoc 50h"
echo "===================================="
sleep 432000