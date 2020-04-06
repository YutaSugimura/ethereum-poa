cd && cd Parity

sudo cp parity.service /etc/systemd/system 
sudo chmod +x /etc/systemd/system/parity.service 
sudo systemctl enable parity

sudo systemctl start parity 

sudo systemctl status parity


curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545