echo "Tai file boot"
wget -O https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
echo "Tai xuong iso windows"
read -p "nhap link tai iso: " CRP
wget -O win.iso $CRP 
echo "Tai xuong ngrok"
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xf ngrok.tgz
rm -rf ngrok.tgz
read -p "Nhap Authtoken: " CRP 
./ngrok authtoken $CRP
./ngrok tcp 5900
