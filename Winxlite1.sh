echo "ban quyen boi https://t.me/chamhoi72"
echo "boi hoang"
echo "3"
echo "2"
echo "1"
echo "dang chay"
echo "chay xong roi"
sudo su
wget -O bios64.bin https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
echo "tai xuong iso"
read -p "nhap lien ket iso de tai: " CRP
wget -O windows.iso $CRP
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xf ngrok.tgz
rm -rf ngrok.tgz
echo "hay di lay token de nhap"
read -p "nhap token di cu: " CRP
./ngrok config add-authtoken $CRP
echo "dang lay ip sau khi co thi qua trang moi,hay tai vnc de nhap ip(sau khi da nhap het lenh)"
echo "10"
echo "9"
echo "8"
echo "7"
echo "6"
echo "5"
echo "4"
echo "3"
echo "2"
echo "1"
echo "da co ip"
./ngrok tcp 5900
