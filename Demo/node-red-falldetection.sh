#!/bin/bash

# 更新系統
sudo apt update
sudo apt upgrade -y

# 安裝 Node.js 和 npm
sudo apt install curl

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc

nvm install 20

# 檢查 Node.js 和 npm 版本
node -v
npm -v

# 安裝 Node-RED
sudo npm install -g --unsafe-perm node-red

# 啟動 Node-RED
node-red &

# 等待 Node-RED 啟動
sleep 10

# 自動打開瀏覽器並連接到 localhost:1880
xdg-open http://localhost:1880


####-----

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")  # 獲取腳本所在目錄
FLOW_FILE="$SCRIPT_DIR/flows.json"

if [ ! -f "$FLOW_FILE" ]; then
    echo "flows.json file not found in $SCRIPT_DIR. Please make sure it exists."
    exit 1
fi

echo "Importing flows.json to Node-RED directory..."
cp "$FLOW_FILE" $HOME/.node-red/flows_$(hostname).json

# 安裝 Node-RED 所需的節點模組
echo "Installing required Node-RED modules..."
cd $HOME/.node-red

# 如果沒有 package.json，則初始化一個
if [ ! -f "package.json" ]; then
    echo "No package.json found, creating one..."
    npm init -y --scope=node-red-project
    # 修改 package.json 名稱，避免 ".node-red" 作為名稱
    sed -i 's/"name": "node-red-project"/"name": "my-node-red-project"/' package.json
fi

# 安裝 Node-RED Dashboard UI 模組
npm install node-red-dashboard

# 安裝 node-red-contrib-aedes 模組
npm install node-red-contrib-aedes

# 安裝其他模組
npm install


: <<'EOF'
# 創建 systemd 服務以便 Node-RED 在系統啟動時自動啟動
echo "Setting up Node-RED as a systemd service..."
sudo bash -c 'cat <<EOF > /etc/systemd/system/nodered.service
[Unit]
Description=Node-RED
After=network.target

[Service]
ExecStart=/usr/bin/env node-red --max-old-space-size=512
WorkingDirectory=/home/$USER/.node-red
User=$USER
Group=$USER
Nice=10
SyslogIdentifier=Node-RED
StandardOutput=syslog
Restart=on-failure
KillSignal=SIGINT

[Install]
WantedBy=multi-user.target
EOF'

# 重新加載 systemd 並啟動 Node-RED
echo "Reloading systemd and starting Node-RED..."
sudo systemctl daemon-reload
sudo systemctl enable nodered
sudo systemctl start nodered
EOF

# 檢查 Node-RED 狀態
echo "Checking Node-RED status..."
sudo systemctl status nodered

# 自動開啟瀏覽器連接到 Node-RED
echo "Opening Node-RED in the default web browser..."
xdg-open http://localhost:1880 &

echo "Node-RED installation and setup complete. You can access it at http://localhost:1880"

