+++
author = "Tony Lin"
title = "[Swift]客製化AlertView 使用Xib"
date = "2021-08-30 10:00:00"
categories = [
]
tags = [    
  "Swift",
  "AlertController",
  "XIB",  
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_alert_1630488999.png"
]
+++

使用UIViewController搭配Xib設計AlertView的樣板
<!--more-->

## 作法

### step 1 新增檔案

|                     xib                      |                     view                     |
| :------------------------------------------: | :------------------------------------------: |
| ![image](/images/posts/swift_alert_1630487835.png) | ![image](/images/posts/swift_alert_1630487836.png) |

### step 2 設計畫面

|                   空白畫面                   |                   設計畫面                   |
| :------------------------------------------: | :------------------------------------------: |
| ![image](/images/posts/swift_alert_1630487933.png) | ![image](/images/posts/swift_alert_1630487948.png) |

### step 3 綁定關聯

- 綁定 class
![image](/images/posts/swift_alert_1630487950.png)

- 綁定 View

按 **option** 拖曳

|                      1                       |                      2                       |
| :------------------------------------------: | :------------------------------------------: |
| ![image](/images/posts/swift_alert_1630487988.png) | ![image](/images/posts/swift_alert_1630487989.png) |

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
    showXibAlertView()
}

func showXibAlertView() {
    let view = CustomAlertView()
    view.modalPresentationStyle = .overFullScreen
    self.present(view, animated: true, completion: nil)
}
```

![image](/images/posts/swift_alert_1630488999.png)


## 其他參數

### 效果

可自由添加轉場效果

UIModalTransitionStyle
- coverVertical：垂直進入
- flipHorizontal：水平翻轉
- crossDissolve：淡入淡出

```swift
func showXibAlertView() {
    let view = CustomAlertView()
    view.modalPresentationStyle = .overFullScreen
    view.modalTransitionStyle = .crossDissolve
    self.present(view, animated: true, completion: nil)
}
```


## 相關文章

- [[客製化AlertView 使用Storyboard]](/posts/ios/swift/alertview/custom_alert_storyboard)
