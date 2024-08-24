PLEASE BE SAFE AND ONLY USE BURNER WALLET, ASK FOR SUPPORT IN COAL DISCORD, DONT ANSWER DMS

COPY PASTE THE FOLLOWING:

*Step1* git clone https://github.com/coal-digital/coalpool.git

*Step2* cd coalpool

*Step3* cargo build --release

Next step costs .001 SOLANA

IMPORTANT. You need to find your file Path. and replace the filepath below. You can find your username typing whoami
Windows users need to use \ instead of / in file paths

*Step4* ./target/release/coal-hq-client --keypair /root/username/filepath/id.json signup

*Step5* ./target/release/coal-hq-client --keypair /root/username/filepath/id.json mine --cores 15

For step 5 replace filepath and set cores to the # of THREADS your CPU supports -1. Ex: AMD 16 core, can use 31. 
For optimzation run ./target/release/coal-hq-client benchmark --cores NUMBER   and test different # for --cores 

For any help please join the Discord and look for the HELP channel
https://discord.gg/8tVgPackKq
