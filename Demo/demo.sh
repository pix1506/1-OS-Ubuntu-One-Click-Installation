#!/bin/bash

# 安裝依賴項
echo "正在安裝依賴項..."
pip install -r requirements.txt

# 檢查是否成功安裝
if [ $? -ne 0 ]; then
  echo "錯誤：依賴項安裝失敗。請檢查問題。"
  exit 1
fi

echo "依賴項安裝成功！"

# 運行遊戲
echo "正在啟動猜單詞遊戲..."
python3 game.py

if [ $? -ne 0 ]; then
  echo "錯誤：遊戲啟動失敗。"
  exit 1
fi

echo "遊戲結束！"
