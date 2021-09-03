+++
author = "Tony Lin"
title = "macOS 系統設定彙整"
date = "2021-01-01 00:00:00"
categories = [
]
tags = [ 
  
]
series = [
  "macOS",
]
images = [

]
toc = true
featured = true
+++

整理一些常用到的資訊
<!--more-->

## 系統

### 快速更新軟體

```shell
sudo softwareupdate -i -a
```

### 釋放記憶體

```shell
sudo purge
```

### 自動清理記憶體

- 1.輸入指令：

```shell
crontab -e
```

- 2.輸入後請按「A」，別按 Enter！

- 3.輸入文字
```shell
#每30分鐘自動清空記憶體
*/30 * * * * /usr/bin/purge
```

- 4.輸入後請按「ESC」，再按下「:」，輸入「wq」，最後按下「Enter」

![img](/images/posts/macos_system_setting_contents_1.png)

## 預設

### 顯示隱藏檔案

```shell
defaults write com.apple.finder AppleShowAllFiles true; 
killall Finder
```

|                     隱藏                      |                     顯示                      |
| :-------------------------------------------: | :-------------------------------------------: |
| ![img](/images/posts/open_hidden_files_1.png) | ![img](/images/posts/open_hidden_files_2.png) |

### 只顯示已打開的應用程序

```shell
defaults write com.apple.dock static-only -boolean true; 
killall Dock
```

### 變更截圖路徑

```shell
defaults write com.apple.screencapture location ~/Downloads/screenshot;
defaults write com.apple.screencapture type png
```
