+++
author = "Tony Lin"
title = "[Swift]如何使用ActionSheet"
date = "2021-08-30 09:00:00"
categories = [
]
tags = [    
  "Swift",
  "AlertController",
  "ActionSheet",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_alertcontroller_2.png"
]
+++

<!--more-->

![image](/images/posts/swift_alertcontroller_2.png)

```swift
@IBAction func donePressed(_ sender: Any) {
    let sheet = getContactSheet()
    self.present(sheet, animated: true, completion: nil)
}

func getContactSheet() -> UIAlertController {
    let actSheet = UIAlertController(title: "聯絡我們", message: nil, preferredStyle: .actionSheet)
    let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
    let telAction = UIAlertAction(title: "語音客服", style: .default, handler:{ action in
   
    })
    let webAction = UIAlertAction(title: "線上客服", style: .default, handler: { action in
                 
    })
    actSheet.addAction(cancelAction)
    actSheet.addAction(webAction)
    actSheet.addAction(telAction)
    return actSheet
}
```
