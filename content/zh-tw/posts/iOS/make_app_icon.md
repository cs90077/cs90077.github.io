+++
author = "Tony Lin"
title = "製作iOS APP圖示"
date = "2018-09-14 00:00:00"
categories = [
]
tags = [ 
  "Assets"
]
series = [
  "iOS",
]
images = [
 
]
+++

iOS的APP icon在規格上要求相當高，如果沒有依照它的格式去弄，是無法完美呈現在APP上的。
<!--more-->

如果將icon規格一一告訴UI，再請他出圖，我相信你很快會被討厭的...

有了 [MakeAppicon](https://makeappicon.com/) 這個工具之後，往後不用再麻煩UI小姐，你自己也可以把圖片切好。


### 準備一張原圖

- 上面推薦使用 1536x1536 解析度的圖，以壓縮出小Icon

| 選擇圖片 | 開始運轉 |
:----: | :----: 
![camera](/images/posts/app_1629422431.png) | ![camera](/images/posts/app_1629422432.png)

### 選擇規格 iOS/Android

很貼心的是，他除了有IOS的規格之外，還可以選擇Android的，依照不同的系統，需要的圖片大小也不同

- iOS規格：1x、2x、3x

![camera](/images/posts/app_1629422433.png)

- Android規格：mdpi(1x)、hdpi(1.5x)、xhdpi(2x)、xxhdpi(3x)、xxhdpi(4x)

![camera](/images/posts/app_1629422434.png)

### 完成

- 成功之後，你可以直接將圖片轉寄至你的mail上面

![camera](/images/posts/app_1629422435.png)

##### 使用效果

- 以iOS APP 做為使用
- Project > Assets.xcassets

![camera](/images/posts/app_1629422436.png)

### 參考
- [**MakeAppicon**](http://makeappicon.com/)
- [裝置大小](https://cg2010studio.com/2014/04/20/app-icon-size和launch-image-size/)

