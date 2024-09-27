# 用Bash開發一鍵安裝的腳本

## 撰寫動機
腳本（Scripting）是利用腳本語言（如Bash、Python、PowerShell等）來自動化一系列任務的過程，本篇希望能給沒接觸過腳本的學生或菜鳥工程師一個參考，如果有什麼疑問或建議歡迎指教~~  
開發腳本不難，但是沒碰過的工程師其實滿多的，是職場菜鳥可以學一下的加分技能!

許多公司開發專案時，需要安裝許多不同的檔案來建構整個系統，造成整個過程非常繁瑣。當開發完成要交貨給客戶時，也都還要再寫一篇複雜的安裝手冊給客戶看，大部分客戶可能也都看得霧煞煞。
因此撰寫腳本是解決這個問題的方式，在大學去竹科實習期間，剛好有機會學如何撰寫腳本，協助公司簡化安裝過程，讓客戶能一鍵安裝。

因為實習的時候安裝的是Ubuntu 18.04 Server版，所以本篇會教各位怎麼安裝Server版，但如果只想學習腳本開發建議直接裝Desktop版本然後閱讀第二章就好。

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
<summary>二. 腳本撰寫過程</summary>
腳本其實就只是一堆Bash指令的集合，重點是要如何寫的快速精簡、具可讀性、錯誤處理。那麼這三點是什麼意思又該如何執行呢?  



快速精簡

</details>

<details>
<summary>三. 範例應用</summary>
（此處可以繼續描述腳本撰寫的內容）
</details>


