sudo apt install python3 python3-pip 
bash $WORKSPACE/scripts/docker.sh
bash $WORKSPACE/scripts/docker-compose.sh
sudo apt install nodejs
sudo apt install npm
sudo apt install junit4
yes | sudo apt install default-jdk
npm uninstall -g angular-cli @angular/cli
yes | npm cache clean
yes | npm install -g @angular/cli@latest
yes | npm install --save-dev @angular/cli@latest
