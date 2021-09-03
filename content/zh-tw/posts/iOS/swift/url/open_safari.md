+++
author = "Tony Lin"
title = "[Swift]開啟Safari網頁"
date = "2021-08-31 00:00:00"
categories = [
]
tags = [    
  "Swift",
  "URL",
  "SafariServices",
]
series = [
  "iOS",
]
images = [

]
+++

![image](/images/posts/swift_open_safari_1.png)
<!--more-->

## 使用URL

```swift
func previewWebView2() {
    let urlString = "https://www.google.com"
    
    if let url = URL(string: urlString) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        }
        else {
            UIApplication.shared.openURL(url)
        }
    }
}
```

## 使用SFSafariViewController

### step 1 import
```swift
import SafariServices
```

### step 2 func

```swift
func previewWebView() {
    let urlString = "https://www.google.com"
    
    if let url = URL(string: urlString) {
        let safari = SFSafariViewController.init(url: url)
        self.present(safari, animated: true, completion: nil)
    }
}
```

## 小細節

- URL：至**APP外部**開啟「Safari APP」顯示網頁
- View：在**APP內部**直接顯示網頁

|                       URL                       |                      View                       |
| :---------------------------------------------: | :---------------------------------------------: |
| ![image](/images/posts/swift_open_safari_1.png) | ![image](/images/posts/swift_open_safari_2.png) |
