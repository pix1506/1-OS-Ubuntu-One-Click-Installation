# 用bash開發一鍵安裝的腳本

## 撰寫動機
腳本（Scripting）是利用腳本語言（如Bash、Python、PowerShell等）來自動化一系列任務的過程，本篇希望能給予沒接觸過腳本的學生或菜鳥工程師一個參考。

許多公司開發專案時，需要安裝許多不同的檔案來建構整個系統，造成整個過程非常繁瑣。當開發完成要交貨給客戶時，也都還要再寫一篇複雜的安裝手冊給客戶看，大部分客戶可能也都看得霧煞煞。
因此撰寫腳本是解決這個問題的方式，在大學去竹科實習期間，剛好有機會學如何撰寫腳本，協助公司簡化安裝過程，讓客戶能一鍵安裝。腳本開發不難，但是沒摸過的工程師其實滿多的，是職場菜鳥可以學一下的加分技能!

本篇會手把手從windows教你怎麼安裝Ubuntu 18.04 Server，到腳本撰寫與實際上機測試。

## 目錄
1. 安裝 Ubuntu 18.04 Server
2. 腳本撰寫過程
3. 實際測試

## 內容
### 一. 安裝 Ubuntu 18.04.6 LTS (Bionic Beaver)
Ubuntu 18.04.6 LTS (Bionic Beaver) 是一個長期支持（LTS）版本，擁有一些特殊的優點，使得許多公司選擇繼續使用這個舊版的 Ubuntu。本篇安裝的是 Server 版，而非一般的 Desktop 版。

**安裝步驟：**
1. 前往 [Ubuntu 下載 ISO 檔](https://releases.ubuntu.com/18.04/)
      ![安裝步驟](readme%20image/圖片2.png)
   
2. 使用 [Rufus](https://rufus.ie/zh_TW/) 製作 Ubuntu 開機碟，可以參考 [PYDOING 大大的教學影片](https://www.youtube.com/watch?v=i7Uee78td-s)，下圖是製作完成後開機碟的樣子。
   開機碟（或Live USB）是指一個可啟動ubuntu的USB隨身碟，一般Desktop版燒錄完打開會是Ubuntu試用版，可以拿來安裝正式的Ubuntu或修復系統等等。Server版打開則是直接進入安裝環節。
      ![開機碟完成](readme%20image/圖片3.png)
      ![Desktop版與Server版](readme%20image/圖片4.png)

3. 燒錄完後便插上隨身碟重開機，開機時電腦品牌的Logo跳出來時就狂按DEL鍵，進入BIOS。(*每台電腦進入bios的按鍵不同，微星是DEL)
   BIOS是電腦開機第一個被載入的軟體，負責初始化硬體，我們可以在此選擇要用哪個裝置開機。
      ![補一張啥時進bios]

6. 進入bios之後選擇用開機碟來開機，開機後就會進入到試用版的Ubuntu，

### 二. 腳本撰寫過程
（此處可以繼續描述腳本撰寫的內容）

### 三. 實際測試
（描述測試的過程和結果）

