+++
author = "Tony Lin"
title = "[Swift]如何使用AlertController"
date = "2021-08-30 08:00:00"
categories = [
]
tags = [    
  "Swift",
  "AlertController",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_alertcontroller_1.png"
]
+++

<!--more-->

## 基本使用

### Alert 

![image](/images/posts/swift_alertcontroller_1.png)

```swift
func showAlert() {
    let alert = UIAlertController(title: "請問是否要刪除！", message: "", preferredStyle: .alert)
    
    let doneAction = UIAlertAction(title: "確定", style: .default, handler: { action in
        print("ok")
    })
    
    let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)

    alert.addAction(doneAction)    
    alert.addAction(cancelAction)
    
    self.present(alert, animated: true, completion: nil)
}
```

## 進階

### 修改Title/Message文字顏色

    按鈕的文字，可以透過style直接做調整
    - .default: 藍字
    - .cancel: 藍字、粗體
    - .destructive: 紅字

![image](/images/posts/swift_alertcontroller_3.png)

```swift
func showAlarmAlert() {
    let title = "警告"
    let message = "不是很重要的警告!"
    
    let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let txtTitle = NSAttributedString(
        string: title,
        attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.darkGray
        ])
    
    let txtMessage = NSAttributedString(
        string: message,
        attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.red
        ])
    
    alertViewController.setValue(txtTitle, forKey: "attributedTitle")
    alertViewController.setValue(txtMessage, forKey: "attributedMessage")
    
    let okAction = UIAlertAction(title: "ok", style: .default) { action in
        print("ok")
    }
    let cancelAction = UIAlertAction(title: "cancel", style: .destructive, handler: nil)
    
    alertViewController.addAction(okAction)
    alertViewController.addAction(cancelAction)
    self.present(alertViewController, animated: true, completion: nil)
}
```

### 調整文字訊息:靠左

message預設是置中對齊，修改成靠左對齊

|                      置中（預設）                       |                      靠左對齊                       |
| :-------------------------------------------------: | :-------------------------------------------------: |
| ![image](/images/posts/swift_alertcontroller_4.png) | ![image](/images/posts/swift_alertcontroller_5.png) |


```swift
func showTextCenterAlert() {
    let title = "確定名單"
    let message = "1.Tony\n2.Ting\n3.hulk\n4.ken"
    
    let alertViewController = UIAlertController(title: title, message: "", preferredStyle: .alert)
    
    // message style
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .left
    let messageText = NSAttributedString(
        string: message,
        attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.red,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
    )
    alertViewController.setValue(messageText, forKey: "attributedMessage")
    
    let doneAction = UIAlertAction(title: "確定", style: .default) { action in
        print("ok")
    }
    
    alertViewController.addAction(doneAction)
    
    self.present(alertViewController, animated: true, completion: nil)
}
```
