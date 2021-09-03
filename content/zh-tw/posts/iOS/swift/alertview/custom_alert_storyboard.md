+++
author = "Tony Lin"
title = "[Swift]客製化AlertView 使用Storyboard"
date = "2021-08-30 11:00:00"
categories = [
]
tags = [    
  "Swift",
  "AlertController",
  "Storyboard",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_alert_1630488999.png"
]
+++

使用UIViewController搭配Storyboard設計AlertView的樣板
<!--more-->

主要做法與 [[客製化AlertView 使用Xib]](/posts/ios/swift/alertview/custom_alert_xib) 大致雷同


## 作法

### step 1 新增檔案

|                     sb                      |                     view                     |
| :------------------------------------------: | :------------------------------------------: |
| ![image](/images/posts/swift_alert_1630545642.png) | ![image](/images/posts/swift_alert_1630487836.png) |

### step 2 設計畫面

|                   空白畫面                   |                   設計畫面                   |
| :------------------------------------------: | :------------------------------------------: |
| ![image](/images/posts/swift_alert_1630545643.png) | ![image](/images/posts/swift_alert_1630545644.png) |

### step 3 綁定關聯

- 綁定 class與StoryboardID
![image](/images/posts/swift_alert_1630545645.png)

### step 4 Class

```swift
import UIKit

class CustomAlertView: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var btnDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func donePressed(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
    func setupView() {
        lblTitle.text = "標題"
        lblMessage.text = "文字訊息"
        btnDone.setTitle("確定", for: .normal)
    }
    
}
```

### step 5 使用

```swift
@IBAction func donePressed(_ sender: Any) {
    showStoryboardAlertView()
}

func showStoryboardAlertView() {
    let sb = UIStoryboard(name: "CustomAlertView", bundle: nil)
    let view = sb.instantiateViewController(withIdentifier: "CustomAlertView") as! CustomAlertView
    view.modalPresentationStyle = .overFullScreen
    present(view, animated: true, completion: nil)
}
```

![image](/images/posts/swift_alert_1630488999.png)

## 相關文章

- [[客製化AlertView 使用Xib]](/posts/ios/swift/alertview/custom_alert_xib)