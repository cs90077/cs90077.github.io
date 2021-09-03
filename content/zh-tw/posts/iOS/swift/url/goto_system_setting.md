+++
author = "Tony Lin"
title = "[Swift]前往「系統設定」頁面"
date = "2021-08-31 00:00:00"
categories = [
]
tags = [    
  "Swift",
  "URL",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_setting_1630474892.png"
]
+++

在做權限管理的時候，常常會需要請使用者去開啟權限，可以使用此方法，引導使用者去「設定頁面」操作。
<!--more-->

```swift
func gotoSetting() {

    if let url = URL(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}
```
