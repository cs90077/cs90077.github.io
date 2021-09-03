+++
author = "Tony Lin"
title = "[Swift]使用Bundle取得APP版本號"
date = "2020-11-06 00:00:00"
categories = [
]
tags = [  
  "Swift",
  "Bundle",
]
series = [
  "iOS",
]
images = [

]
+++

想要顯示目前的APP版本號
<!--more-->

## 設定檔

![image](/images/posts/swift_bundle_app_version_1.png)

## 方法

```swift
func getAppVersion()->String {
    var appVersion = ""
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    let build = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    appVersion = "\(version) (\(build))"
    log.debug("app version = \(appVersion)")
    return appVersion
}
```

## 效果

![image](/images/posts/swift_bundle_app_version_2.png)
