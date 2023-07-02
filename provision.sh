#!/bin/bash
sudo apt-get update -y
# sudo apt-get upgrade -y
sudo apt-get install pip3 -y
sudo apt-get install python3 -y
sudo apt-get install git -y
sudo apt-get install python-is-python3
cd
git clone https://github.com/PromtEngineer/localGPT.git
cd localGPT/
pip install -r requirements.txt
git clone https://github.com/PanQiWei/AutoGPTQ.git
cd AutoGPTQ
git checkout v0.2.2
pip install .
cd
sudo apt install nvidia-driver-510 -y
sudo apt-get -y install nvtop
echo "Enter your machines IP Addr:"
read ipaddr
sed -i "s/http:\/\/localhost:/http:\/\/$ipaddr:/g" localGPT/localGPTUI/localGPTUI.py
sed -i '$s/.*/    app.run(host='"'"$ipaddr"'"', debug=False, port=5111)/' localGPT/localGPTUI/localGPTUI.py


echo "Restarting System to apply drivers"
echo "Restarting in 10sec, ctrl+c to cancel"
wait 10
#sudo reboot
