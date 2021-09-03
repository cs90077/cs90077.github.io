+++
author = "Tony Lin"
title = "金礦咖啡 訂餐APP"
date = "2013-04-02 00:00:00"
tags = [ 
  "APP",
  "Java",
]
series = [
  "Android",
]
images = [
  "images/icon/app_icon_crown_fancy_2013.png"
]
toc = false
+++

此APP是以「金礦咖啡」做為設計範例，模擬互動式點餐APP，結合後台POS系統，由APP定位搜尋附近之店家，發送訂購餐點後，後台接收到資訊開始製作，顧客至預定店家出示QRcode取餐。
<!--more-->

## 系統架構

### ASP.NET + SQL Server

- ERP後台資料管理(會員管理、產品管理、訂單管理)
- Ajax 動態更新畫

### Android APP

- Google Map
- QR Code
- GridView 廣告

## 示意圖

![app](/images/posts/app_crown_1.png)
![app](/images/posts/app_crown_2.png)