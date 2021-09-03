
+++
author = "Tony Lin"
title = "[Swift]使用URL撥打電話"
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
  "images/posts/swift_call_phone_2.png"
]
+++

<!--more-->

|                       1                       |                       2                       |
| :-------------------------------------------: | :-------------------------------------------: |
| ![image](images/posts/swift_call_phone_1.png) | ![image](images/posts/swift_call_phone_2.png) |


```swift
@IBAction func donePressed(_ sender: Any) {
    callPhone()
}

func callPhone(){
    let txtPhone = "123"
    if let url = URL(string: "tel://\(txtPhone)"), UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
```

