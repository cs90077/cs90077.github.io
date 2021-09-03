+++
author = "Tony Lin"
title = "清除Xcode肥大檔案"
date = "2021-02-14 00:00:00"
categories = [
]
tags = [ 
  "Xcode", 
]
series = [
  "macOS",
]
images = [
  
]
+++

超實用的，一轉眼清了40幾G
<!--more-->

## 透過指令

```shell
rm -rf ~/Library/Developer/Xcode/Archives/
rm -rf ~/Library/Developer/Xcode/DerivedData/
rm -rf ~/Library/Developer/Xcode/iOS DeviceSupport/
rm -rf ~/Library/Developer/Xcode/Products/
rm -rf ~/Library/Developer/CoreSimulator/Devices/
rm -rf ~/Library/Developer/XCPGDevices/
```

## DevCleaner

推薦使用DevCleaner這個軟體，幫助你一鍵清除檔案

![image](/images/posts/macos_developer_cleaner_1.png)