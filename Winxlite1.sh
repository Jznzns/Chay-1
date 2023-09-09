echo "tai bios"
wget -O bios64.bin https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
read -p "nhap lien ket iso de tai: " CRP
wget -O windows.iso $CRP
echo "tai ngrok"
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
echo "..."
tar -xf ngrok.tgz
echo "..."
rm -rf ngrok.tgz
echo "hay di lay token de nhap"
read -p "nhap token di cu: " CRP
./ngrok config add-authtoken $CRP
echo "dang lay ip sau khi co thi qua trang moi,hay tai vnc de nhap ip(sau khi da nhap het lenh)"
echo "..."
./ngrok tcp 5900
