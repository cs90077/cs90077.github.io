+++
author = "Tony Lin"
title = "[Swift]發送SMS簡訊"
date = "2021-08-31 00:00:00"
categories = [
]
tags = [    
  "Swift",
  "URL",
  "MessageUI",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_send_sms_2.png"
]
+++

<!--more-->
![image](/images/posts/swift_send_sms_2.png)

## 使用URL

```swift
@IBAction func donePressed(_ sender: Any) {
    sendSMS()
}

func sendSMS() {
    let phoneNumber = "0911222333"
    let body = "我是內容\r\n第二個內容"
    
    let smsString = "sms:\(phoneNumber)&body=\(body)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    if let url = URL(string: smsString) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
```

## 使用MFMessageComposeViewController

### step 1 import

```swift 
import MessageUI
```

### step 2 func

```swift
@IBAction func donePressed(_ sender: Any) {
    showMessageComposer()
}

func showMessageComposer() {
    let phoneNumber = "0911222333"

    if (MFMessageComposeViewController.canSendText()) {
        let composer = MFMessageComposeViewController()
        composer.messageComposeDelegate = self
        composer.recipients = [phoneNumber]
        composer.body = "Message Body"
        self.present(composer, animated: true, completion: nil)
    }
}
```

### step 3 delegate

```swift

extension UIViewController: MFMessageComposeViewControllerDelegate {
    
    public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
        case .cancelled:
            break
        case .sent:
            break
        case .failed:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
}
```

## 小細節

- URL：至**APP外部**開啟「簡訊APP」處理
- View：在**APP內部**直接做簡訊處理

|                     URL                      |                     View                     |
| :------------------------------------------: | :------------------------------------------: |
| ![image](/images/posts/swift_send_sms_1.png) | ![image](/images/posts/swift_send_sms_2.png) |