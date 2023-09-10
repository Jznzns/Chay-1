clear
echo "Tải bios"
sleep 1 &>/dev/null &
wget -O bios64.bin https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
read -p "Nhập liên kết iso để sử dụng: " iso
wget -O windows.iso $iso
echo "Iso đã tải xong"
sleep 1 &>/dev/null &
clear
echo "Tải ngrok"
sleep 1 &>/dev/null &
clear
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
echo "..."
sleep 1 &>/dev/null &
tar -xf ngrok.tgz
rm -rf ngrok.tgz
echo "Hãy đi lấy token"
read -p "Nhập token đi kid: " token
./ngrok config add-authtoken $token
sleep 1 &>/dev/null &
clear
echo "Khi nhập xong lệnh thì tạo bash mới)"
sleep 1 &>/dev/null &
echo "..."
sleep 1 &>/dev/null &
clear
echo "Nhập vùng muốn chọn (VN chưa hỗ trợ)"
echo "danh sách mã vùng nên xài"
echo "- us: Hoa Kỳ (United States)
- eu: Châu Âu (Europe)
- ap: Châu Á - Thái Bình Dương (Asia/Pacific)
- au: Úc (Australia)
- sa: Nam Mỹ (South America)
- jp: Nhật Bản (Japan)
- in: Ấn Độ (India)
- kh: Cam-pu-chia (Campuchia)
- sg: Xin-ga-po (Singapore)
- cn: Trung Quốc (China)
- ph: Phi-líp-pin (Philippines)
- la: Lào (Laos)
- ngrok.io: Vùng mặc định
Ví dụ, để chọn region là Châu Âu (Europe), bạn có thể sử dụng lệnh sau:
ngrok region eu"
read -p "Nhập vùng muốn sử dụng: " region
./ngrok tcp -region $region 5900
