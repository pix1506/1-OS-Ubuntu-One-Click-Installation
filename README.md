# 用bash開發一鍵安裝的腳本

## 開發動機
撰寫腳本（Scripting）是利用腳本語言（如Bash、Python、PowerShell等）來自動化一系列任務的過程。目前很多公司開發大型系統時，經常需要安裝許多不同的檔案來建構系統，造成整個過程非常繁瑣，還需要寫安裝手冊給客戶看，而且客戶通常也都看得霧煞煞。

在實習期間，剛好有機會學如何撰寫腳本，協助公司簡化安裝過程，讓客戶能一鍵安裝。目前的大學環境中可能比較少接觸到這方面的知識，所以就撰寫了這篇簡單描述過程，也給有需要的人參考。

## 目錄
1. 安裝 Ubuntu 18.04.6 LTS (Bionic Beaver)
2. 腳本撰寫過程
3. 實際測試

## 內容
### 一. 安裝 Ubuntu 18.04.6 LTS (Bionic Beaver)
Ubuntu 18.04.6 LTS (Bionic Beaver) 是一個長期支持（LTS）版本，擁有一些特殊的優點，使得許多公司選擇繼續使用這個舊版的 Ubuntu。本篇安裝的是 Server 版，而非一般的 Desktop 版。

**安裝步驟：**
1. 前往 [Ubuntu 下載 ISO 檔](https://releases.ubuntu.com/18.04/)
      ![安裝步驟](readme%20image/圖片2.png)
   
2. 使用 [Rufus](https://rufus.ie/zh_TW/) 製作 Ubuntu 開機碟，可以參考[PYDOING大大的教學影片](https://www.youtube.com/watch?v=i7Uee78td-s)
      ![安裝後隨身碟的樣子](readme%20image/圖片3.png)

3. 安裝完後便插上隨身碟重開機，開機時電腦品牌的Logo跳出來時就狂按DEL鍵，進入bios。(*每台電腦進入bios的按鍵不同，微星是DEL)
      ![補一張啥時進bios]

### 二. 腳本撰寫過程
（此處可以繼續描述腳本撰寫的內容）

### 三. 實際測試
（描述測試的過程和結果）

