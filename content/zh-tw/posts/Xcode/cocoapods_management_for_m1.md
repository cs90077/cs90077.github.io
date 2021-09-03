+++
author = "Tony Lin"
title = "安裝CocoaPods套件管理 支援M1"
date = "2021-01-25 00:00:00"
categories = [
]
tags = [  
  "Swift",
  "CocoaPods",
  "GitHub",  
  "Xcode",
]
series = [
  "iOS",
]
images = [
  "images/icon/icon_cocoapods.png"
]
toc = false
+++

在 Apple Silicon M1 安裝CocoaPods套件
<!--more-->

基本安裝請參考：[Cocopods套件管理](/posts/xcode/cocoapods_management)

M1的系統架構不同，用以前的方法安裝會失敗

需要指定x86方式安裝

![m1](/images/posts/cocoapods_management_for_m1_1.png)

## 安裝套件

### step1

```shell
sudo arch -x86_64 gem install ffi
```

### step2

```shell
arch -x86_64 pod install
```
