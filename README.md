this isn't the proper coalpool client .  
the proper coalpool client is at https://github.com/coal-digital/coalpool .  

to install anyway :  
   $ cd ~    
   $ git clone https://github.com/zoonose/coalpond.git    
   $ cd coalpond    
   $ cargo build --release    

to update :  
   $ cd ~/coalpond    
   $ git pull    
   $ cargo update    
   $ cargo build --release    

differences from the proper coalpool client :  
    - default keypair works    
    - cutoff time is displayed a few different times just because of curiosity    
    - bash script front end, might be convenient I guess    
    - pond
