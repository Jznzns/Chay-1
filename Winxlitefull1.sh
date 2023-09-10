clear
echo "Chào nha"
sleep 2 &>/dev/null
clear
echo "Đang tải tổng hợp"
sleep 2 &>/dev/null &
clear
wget -O Winxlite3.sh https://raw.githubusercontent.com/Makabaa/Chay/main/Winxlite3.sh
echo "Đang tải tổng hợp"
sleep 2 &>/dev/null &
clear
wget -O Winlite1.sh https://raw.githubusercontent.com/Makabaa/Chay/main/Winlite1.sh
sleep 2 &>/dev/null &
clear
echo "Lựa chọn để cài vps:"
echo "1. Xài iso"
echo "2. Xài gz"
read choice
if [ $choice -eq 1 ]
then
chmod +x Winxlite3.sh && ./Winxlite3.sh
elif [ $choice -eq 2 ]
then
chmod +x Winlite1.sh && ./Winlite1.sh
else
  echo "Lựa chọn không hợp lệ"
fi
