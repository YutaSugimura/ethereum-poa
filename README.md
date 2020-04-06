
# Document 
   Link: 
   https://wiki.parity.io/JSONRPC 

# Setup

   1. update 

   ``` zsh 
      sudo apt update -y && sudo apt install vim -y && sudo apt upgrade -y 
   ``` 

   2. parity install 

   ``` zsh 
      bash <(curl https://get.parity.io -L) -r stable
   ``` 

   3. git clone 

   ``` zsh 
      git clone https://github.com/YutaSugimura/ethereum-poa-parity.git 
      mv ethereum-poa-parity Parity && cd Parity 
   ``` 

   4. parity start 

   ``` zsh 
      parity 
      # startしたらすぐにctl + cで終了 
      # ~/.local/share/io.parity.ethereum が生成される 
   ``` 

   5. start config PoA 

   ``` zsh 
      parity --config ./config/config.toml
   ``` 

   6. create Validator Accounts 

   ``` zsh 
      # 別window
      curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["$MNEMONIC", "$PASSWORD"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545
   ``` 

   7. stop config PoA 

   ``` zsh 
      # ctl + c 
      # 停止させる
   ``` 

   8. create password-file 
   
   ``` zsh 
      cd && mkdir .safe 
      echo '$PASSWORD' >> .safe/validator.pwd 
   ``` 

   9. setting systemctl 

   ``` zsh 
      cd Parity 
      sudo cp parity.service /etc/systemd/system 
      sudo chmod +x /etc/systemd/system/parity.service 
      sudo systemctl enable parity 
   ``` 

   10. start PoA 

   ``` zsh 
      sudo systemctl start parity 
      sudo systemctl status parity 
   ``` 

   11. cofirm peer enode 

   ``` zsh 
      curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545 

      # result {"jsonrpc":"2.0","result":"enode://d4af2ed1b929c7a7a10aa11ba54349cac61cd4fb1b3e7e8fb11ebaccdb3175489980125952d2514c25260b5dc611afb937cf72d40a133ec4fde5719834a67d71@171.11.11.11:30300","id":0}
   ``` 

   12. connect peer 

   ``` zsh 
      # 他peer 
      curl --data '{"jsonrpc":"2.0","method":"parity_addReservedPeer","params":["ENODE://"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545 
   ``` 

   13. unlock Accounts 

   ``` zsh 
      curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["$MNEMONIC", "$PASSWORD"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545 

      or 

      curl --data '{"method":"parity_newAccountFromSecret","params":["$PRIVATEKEY","$PASSWORD"],"id":1,"jsonrpc":"2.0"}' -H "Content-Type: application/json" -X POST localhost:8545 

      # result {"jsonrpc":"2.0","result":"0x001060e5c7eef4c637fb46e2f389e1d14a447ea8","id":0}
   ```


# 接続 

   ``` js 
      // get web3
      const provider = new Web3.providers.HttpProvider(
         "http://ip-address:8545"
      );
      const web3 = new Web3(provider);
   ```