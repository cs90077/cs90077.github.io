+++
author = "Tony Lin"
title = "[Swift]發送Email信件"
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
  "/images/posts/swift_send_email_2.png"
]
+++

<!--more-->
![image](/images/posts/swift_send_email_2.png)

## 使用URL

字串拼接格式：

    「mailto:abc@mail.com?subject=我是標題&body=我是內容」

1. 收件人：用 “ , “ 分開
2. 副本：cc
3. 密件副本：bcc
4. 標題：subject
5. 內容：body


```swift
@IBAction func donePressed(_ sender: Any) {
    sendEmail()
}

func sendEmail() {
    let email = "cs90077@gmail.com"
    let subject = "我是標題"
    let body = "我是內容\r\n第二個內容"
    
    let mailtoString = "mailto:\(email)?subject=\(subject)&body=\(body)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    if let url = URL(string: mailtoString) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
```

## 使用MFMailComposeViewController

### step 1 import

```swift 
import MessageUI
```

### step 2 func

```swift
@IBAction func donePressed(_ sender: Any) {
    showMailComposer()
}

func showMailComposer() {
    let email = "cs90077@gmail.com"
    let subject = "我是標題"
    let body = "我是內容\r\n第二個內容"

    if MFMailComposeViewController.canSendMail() {
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients([email])
        composer.setSubject(subject)
        composer.setMessageBody(body, isHTML: false)
        present(composer, animated: true)
    }    
}

```

### step 3 delegate

```swift
extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        
        switch result {
        case .cancelled:
            break
        case .saved:
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

## 驗證Email格式

```objc
+ (BOOL)validateEmailWithString:(NSString *)email {
    NSString *emailRegExp = @"[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegExp];
    return [emailTest evaluateWithObject:email];
}
```

## 小細節

- URL：至**APP外部**開啟「郵件APP」處理
- View：在**APP內部**直接做郵件處理

|                      URL                       |                      View                      |
| :--------------------------------------------: | :--------------------------------------------: |
| ![image](/images/posts/swift_send_email_1.png) | ![image](/images/posts/swift_send_email_2.png) |


## issue

目前測試發現，使用mailto的方法，目前在iOS 14.6中，「 \r\n 」無法做出換行效果，會顯示成<BR>，而使用MFMailComposeViewController則無此問題

[[Mailto url encoding issue iOS 14.6]](https://developer.apple.com/forums/thread/681023)

![image](/images/posts/swift_send_email_2.png)

