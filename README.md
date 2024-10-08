# 用Bash開發一鍵安裝的腳本

## 撰寫動機
腳本（Scripting）是利用腳本語言（如Bash、PowerShell等）來自動化一系列任務的過程，本篇希望能給沒接觸過腳本的學生或菜鳥工程師一個參考，如果有什麼疑問或建議歡迎指教~~  
開發腳本不難，但是沒碰過的工程師其實滿多的，是職場菜鳥可以學一下的加分技能!

許多公司開發專案時，需要安裝許多不同的檔案來建構整個系統，造成整個安裝過程非常繁瑣。當開發完成要交貨給客戶時，也都還要再寫一篇複雜的安裝手冊給客戶看，大部分客戶可能也都看得霧煞煞。
因此撰寫腳本是解決這個問題的方式，在大學去竹科實習期間，剛好有機會學如何撰寫腳本，協助公司簡化安裝過程，讓客戶能一鍵安裝。

因為實習的時候安裝的是Ubuntu 18.04 Server版，所以本篇會教各位怎麼安裝Server版，但如果只想學習腳本開發建議直接裝Desktop版本然後閱讀第二、三章就好。

## 點擊觀看內容
<details>
<summary>一. 安裝 Ubuntu 18.04 Server</summary>

**安裝步驟：**
1. 前往 [Ubuntu 下載 ISO 檔](https://releases.ubuntu.com/18.04/)
      ![安裝步驟](readme%20image/圖片2.png)
   
2. 使用 [Rufus](https://rufus.ie/zh_TW/) 製作 Ubuntu 開機碟，可以參考 [PYDOING 大大的教學影片](https://www.youtube.com/watch?v=i7Uee78td-s)，下圖是製作完成後開機碟的樣子。  
   開機碟（或Live USB）是指一個可啟動ubuntu的USB隨身碟，一般Desktop版燒錄完打開會是Ubuntu試用版的桌面，可以拿來安裝正式的Ubuntu或修復系統等等。
   
   Server版打開則是直接進入安裝介面，如下圖所示。  
   ![開機碟完成](readme%20image/圖片3.png)  
   ![Desktop版與Server版](readme%20image/圖片4.png)

3. 燒錄完成後變可重新開機，開機時狂按各家廠牌設定的BIOS鍵進入BIOS。  
   (*每台電腦進入bios的按鍵不同，微星是DEL鍵)  
   BIOS是電腦開機第一個被載入的軟體，負責初始化硬體，我們可以在此選擇要用哪個裝置開機。  
   ![補一張啥時進bios](readme%20image/圖片6.png)

4. 選擇使用開機碟裝置來開機，開機後就會進入到安裝介面，這裡基本上就是照著建議裝就好了，只有分割磁碟那裡比較危險要小心不要刪到自己的資料。
   ![補一張磁碟分割](readme%20image/圖片5.jpg)
</details>

<details>
<summary>二. 腳本撰寫經驗談</summary>
  
**腳本撰寫：**
腳本其實就只是一堆Bash指令的集合，如果真的沒有在cmd下過指令的初學者可以先看看這篇(補個基礎)。要寫得好不用死背這些東西，寫久自然就會了，重點是要**快速精簡、具可讀性、錯誤處理、檢查或等待機制**。那麼這三點是什麼意思又該如何執行呢?  

**1.快速精簡：**
編寫指令不難，但是要如何寫得有**效率**呢? 筆者認為第一步是要先**設計並熟悉你的資料夾結構**。假設今天您設計了一套軟體，並且要設計如何讓客戶用簡單的方式安裝，可能的結構範例如下:
![補一張資料夾結構](readme%20image/圖片7.png)  
假設您今天設計了一套軟體，要幫客戶的新電腦安裝您的產品，那你的安裝包就可以設計成這樣，包含Ubuntu GUI安裝資料、顯卡驅動(GPU Driver)、您設計的軟體(System Data)、軟體的相關依賴(System Dependencies)、跟其他幫助系統加速的資料等等，每個資料夾的功能定義都簡潔明瞭，這樣不僅能減少撰寫時檢查路徑的時間，客戶端也方便閱讀。  

再來如何**精簡**呢? 假設有一個腳本，它需要多次進行文件壓縮操作，可能像這樣：
```bash
# 壓縮檔案的代碼重複多次
tar -czvf backup1.tar.gz /path/to/dir1
echo "Backup for dir1 completed."

tar -czvf backup2.tar.gz /path/to/dir2
echo "Backup for dir2 completed."

tar -czvf backup3.tar.gz /path/to/dir3
echo "Backup for dir3 completed."
```

那你就可以將重複的部分改為**函數調用**:
```
#!/bin/bash

# 定義壓縮和打印的函數
compress_and_notify() {
    local filename=$1
    local dir=$2

    tar -czvf "$filename" "$dir"
    echo "Backup for $dir completed."
}

# 調用函數來壓縮不同的目錄
compress_and_notify "backup1.tar.gz" "/path/to/dir1"
compress_and_notify "backup2.tar.gz" "/path/to/dir2"
compress_and_notify "backup3.tar.gz" "/path/to/dir3"
```

再來就是**避免冗長的程式與命名**，腳本的目的應該是簡單的任務自動化，保持每個腳本專注於一個功能，不要讓腳本變得過於複雜。
如果功能變得複雜，也可以考慮將其**拆成多個腳本**，由主腳本去執行多個小型腳本。

**2.具可讀性：**
**適當的註釋**可以幫助客戶端的工程師或維修時，快速讓人理解目的及原理。我自己習慣還會在**開頭寫出每個腳本的解決目標**，例如:  
![補一張腳本目標](readme%20image/圖片9.png)  
這樣打開檔案就很清楚的知道這份腳本想達成什麼目的。方便我們可以系統化的**畫出流程圖**畫出流程圖，避免錯誤也加速開發，注意這些小細節，才能寫出高品質的腳本。

**3.錯誤處理：**
每台機器的配置都不同，腳本很常會有失敗的情況，所以**印出錯誤及設定處理機制**是很重要的環節。舉例來說，我想複製一個文件到目的地資料夾:
```
#印出錯誤
cp file.txt /destination/         #copy file.txt 到destination
if [ $? -ne 0 ]; then             #如果$?(一種可以儲存上一個命令的狀態的變數) -ne 0(不等於0，失敗的意思)
  echo "Error: 文件複製失敗！"
  exit 1
fi

#加入錯誤處理跟印出錯誤，如果目標不存在，就創建一個
DESTINATION="/destination/"

if [ ! -d "$DESTINATION" ]; then
  echo "目標目錄不存在，正在創建 $DESTINATION..."
  mkdir -p "$DESTINATION"
  if [ $? -ne 0 ]; then
    echo "錯誤：無法創建目標目錄 $DESTINATION"
    exit 1
  fi
fi

cp file.txt "$DESTINATION"
if [ $? -eq 0 ]; then
  echo "文件複製成功！"
else
  echo "錯誤：文件複製失敗。"
  exit 1
fi

```
如果複製失敗就可以印出來。因為腳本是一個自動流程，就算失敗也會繼續執行後面的程式，所以**如果沒有印出來，最後全部執行完可能會很難找出錯誤點**。我們也可以**加入一些簡單的錯誤處理機制**，比如說目的地資料夾不存在時就創建一個新的等等。

**4.檢查或等待機制：**
安裝到一個環節或結束後，我們可以增設一些檢查點，來檢查每個階段有沒有安裝成功，比如說在安裝python函式庫的腳本中加入:
```
#!/bin/bash

# 檢查 OpenCV 是否安裝
if python3 -c "import cv2" 2>/dev/null; then
    echo "OpenCV is installed. Version: $(python3 -c 'import cv2; print(cv2.__version__)')"
else
    echo "OpenCV is not installed."
fi

```
每個階段都設置，可以幫助我們**更快的檢查有沒有成功及問題可能出在哪**。同時，如果安裝某些資料時，我們應該要**增設計時器**等待安裝完成後再繼續，例如:  
![補一張計時器](readme%20image/圖片10.png)
我們設了一個三分鐘的計時器，等待OpenCV安裝完成後，在繼續執行後面的腳本。

</details>
<details>
<summary>三. 從頭開始範例應用(Demo)</summary>

**Let's Demo：**
講完觀念之後，我們可以實作一個小Demo看看~
我撰寫了一個腳本用來安裝我以前開發的小專案，首先就先git clone吧
```
git clone https://github.com/pix1506/BashScripts-OneClickInstallation.git
```
clone下來之後可以去demo資料夾裡面打開腳本（node-red-falldetection.sh），這裡寫了一個範例腳本是[安裝node-red跟導入我開發的小專案json檔](https://github.com/pix1506/NodeRed-FallPrevention.git)。


</details>


