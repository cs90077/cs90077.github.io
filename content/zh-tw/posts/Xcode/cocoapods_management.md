+++
author = "Tony Lin"
title = "安裝CocoaPods套件管理"
date = "2018-09-14 00:00:00"
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
+++

在做開發的時候，不可能所有功能都自己寫，多少會去參考別人使用的程式function，或者引用Library套件。
<!--more-->
這時候套件管理就是一個很重要的工作，對於多人團隊開發相當重要，不然套件百百種，你要整理還真的很麻煩。

幸好Cocoa他有開發出一種套件管理的Pods，提供程式設計師，直接從Github即可引用下載至專案。重點是他在會自己引用，在Burild的時候會自己編譯，超方便的！

## 套件安裝
### step 1 - macOS安裝CocoaPods套件

執行終端機Terminal，安裝Pod套件程式

```shell
$ sudo gem install cocoapods
```

![cocoapods](/images/posts/cocoapods_1629438794.png)

安裝需要一點時間，請耐心等候。


### step 2 - Xcode安裝CocoaPods套件

進入專案資料夾

```shell
$ cd ‘project demo'
```

初始化

```shell
$ pod init
```

> 會多一個Podfile檔案

![cocoapods](/images/posts/cocoapods_1629438796.png)

```shell
$ pod install
```

![cocoapods](/images/posts/cocoapods_1629438797.png)

安裝完成，自動增加以下檔案

* 1.Demo.xcworkspance

* 2.Podfile.lock

* 3.Pods Finder

![cocoapods](/images/posts/cocoapods_1629438798.png)


### step 3 - Xcode使用Pods

開啟 Xcode xcworkspace (往後執行專案，均使用此檔案)

![cocoapods](/images/posts/cocoapods_1629438799.png)

選擇 Pods > Podfile

![cocoapods](/images/posts/cocoapods_1629438800.png)

![cocoapods](/images/posts/cocoapods_1629438801.png)


### step 4 - 修改Podfile

(ps.可以上Github找尋，在此示範範例為 Alamofire 套件)

<!-- ▼swift：[Alamofire]([https://github.com/Alamofire/Alamofire]) -->

```text
pod 'Alamofire'
```

![cocoapods](/images/posts/cocoapods_1629438802.png)


### step 5 - 更新pod

安裝套件，他會自動偵測更新或刪除

```shell
$ pod install
```

- 偵測為更新

![cocoapods](/images/posts/cocoapods_1629438803.png)

- 偵測為刪除

![cocoapods](/images/posts/cocoapods_1629438804.png)

安裝完畢後，Pods會將套件編譯好放入專案中

![cocoapods](/images/posts/cocoapods_1629438805.png)

就可以開始使用啦～

## 套件移除

CocoaPods套件管理非常的好用，但也因為他都幫你做好的關係，黏著性很強，如果想要移除或者替換其他套件管理方式(例如：Carthage)，沒有完全移除乾淨的話，專案是無法正常執行的。

### Step 1 - Delete pods from file

* 刪除Pods文件檔案

1. 刪除 .xcworkspace 檔案

2. 刪除 Podfile 檔案

3. 刪除 Podfile.lock 檔案

4. 刪除 Pods 資料夾

![cocoapods](/images/posts/cocoapods_1629438806.png)

### Step 2 - Delete pods from project

* 開啟 Demo.xcodeproj

![cocoapods](/images/posts/cocoapods_1629438807.png)

* 刪除專案參考資料（遺失的項目

1. 刪除 Pods 資料

2. 刪除 Frameworkds 資料

![cocoapods](/images/posts/cocoapods_1629438808.png)

* Targets > Build Phases

1. 刪除 Check Pods Frameworks

2. 刪除 Check Pods Manifest.lock

3. 刪除 Check Pods Resources

![cocoapods](/images/posts/cocoapods_1629438809.png)

移除以上檔案，就可以正常Build了！(撒花

