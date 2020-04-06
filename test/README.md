
# setup 

  1. update 

  ``` zsh 
    sudo apt update -y && sudo apt install vim -y 
  ``` 

  2. parity install 

  ``` zsh 
    bash <(curl https://get.parity.io -L) 
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
    parity --config config/config.toml --chain test/test_chain.json 
  ``` 

  6. create Validator Accounts 


    #### Validator1 

    ``` zsh 
      curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["potato calm eager heavy burst comfort inside tone skin wild come few", "testMo3290Wte"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540
    ``` 

    or 

    #### Validator2 

    ``` zsh 
      curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["actor resemble wrist comic crop fury jeans mention any theory nurse since", "testMo3290Wte"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540 
    ``` 

  7. stop config PoA 
  
  ``` zsh 
    # ctl + c 
    # 停止 
  ``` 

  8. setting systemctl 

  ``` zsh 
    sudo cp parity.service /etc/systemd/system 
    udo chmod +x /etc/systemd/system/parity.service 
    sudo systemctl enable parity 
  ``` 

  9. start PoA 

  ``` zsh 
    sudo systemctl start parity 
    sudo systemctl status parity 
  ``` 

  10. cofirm peer enode 

  ``` zsh 
    curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545 

    # result {"jsonrpc":"2.0","result":"enode://d4af2ed1b929c7a7a10aa11ba54349cac61cd4fb1b3e7e8fb11ebaccdb3175489980125952d2514c25260b5dc611afb937cf72d40a133ec4fde5719834a67d71@171.11.11.11:30300","id":0}
  ``` 

  12. connect peer 

  ``` zsh 
    # 他peer 
    curl --data '{"jsonrpc":"2.0","method":"parity_addReservedPeer","params":["ENODE://"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545 
  ``` 



# Test Accounts 

### バリデータ 

1. 0x0044b8388491f9c465620db228aa07923bd08e61 
  ``` zsh
    curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["potato calm eager heavy burst comfort inside tone skin wild come few", "testMo3290Wte"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540 

    # {"jsonrpc":"2.0","result":"0x0044b8388491f9c465620db228aa07923bd08e61","id":0} 
  ``` 

2. 0x0037a20a2c075b9fcfa217994ba5c3635cdcf3d0 
  ``` zsh 
    curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["actor resemble wrist comic crop fury jeans mention any theory nurse since", "testMo3290Wte"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540 

    # {"jsonrpc":"2.0","result":"0x0037a20a2c075b9fcfa217994ba5c3635cdcf3d0","id":0} 
  ``` 

### ユーザー 

1. 0x3d13CBddC539D0c8433600a655b9e1d40E8CD658 
  mnemonic: oblige scale move absorb lunar energy excite soup twenty turkey photo motion 
  priv_key: 0x21612484DE763A44C3D6AFF634C3673090F0A9DEDBA0C3F201CB290F0F1E8AA0 

2. 0x2F75eFbf018CDA4540b9b3E3E1eF61fd34618B17 
  mnemonic: misery hill excuse tumble firm summer panther online polar ensure resist fetch 
  privateKey: 0x4615C14AD196D2FFA3702A0C59AC5A99A3D404BCFE10EF6F343D836733E9AF36 