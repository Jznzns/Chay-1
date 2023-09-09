echo "Tai file boot"
wget -O https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
echo "Tai xuong iso windows"
wget -O win.iso https://archive.org/download/windows-x-lite-22621.1928-micro-11-by-fbconan/Windows%20X-Lite%20%2822621.1928%29%20%27Micro%2011%27%20By%20FBConan.iso
echo "Tai xuong ngrok"
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xf ngrok.tgz
rm -rf ngrok.tgz
read -p "Nhap Authtoken: " CRP 
./ngrok authtoken $CRP
./ngrok tcp 5900
