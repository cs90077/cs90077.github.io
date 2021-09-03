+++
author = "Tony Lin"
title = "[Swift]AlertView透過Closure觸發回傳事件"
date = "2021-08-30 13:00:00"
categories = [
]
tags = [    
  "Swift",
  "AlertController",
  "Closure",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_alert_1630565231.png"
]
+++

設計一個良好互動良好的AlertView，當按下確認後要讓ViewController能夠處理完成事件。
<!--more-->

所以需要在AlertView按鈕事件中寫Closure，製造出一個內部呼叫的Block型態。


## 作法

請先閱讀: [客製化AlertView 使用Xib](/posts/ios/swift/alertview/custom_alert_xib/)

![image](/images/posts/swift_alert_1630488999.png)

### step 1 Typealias

    自定義類別typealias，處理Closure事件。

```swift
typealias CompletionHandler = (() -> Void)
var completionHandler:CompletionHandler?
```

### step 2 Event

    按下完成按鈕後，會先關閉視窗，在觸發事件回ViewController。

```swift
@IBAction func donePressed(_ sender: Any) {
    // closure
    dismiss(animated: true) {
        if let handler = self.completionHandler {
            handler()
        }
    }
}
```

### step 3 Closure

    如果Closure會離開此方法，透過其他外部方式觸發回傳，則必須在CompletionHandler前方加上贅詞 @escaping。

```swift
extension CustomAlertView {
    
    static func show(_ viewController:UIViewController,
                     doneHandler:@escaping CompletionHandler) {
        let page = CustomAlertView()
        page.modalPresentationStyle = .overFullScreen
        page.modalTransitionStyle = .crossDissolve
        page.completionHandler = doneHandler
        viewController.present(page, animated: true, completion: nil)
    }
    
}
```

### step 4 Use

    在ViewController中直接呼叫出AlertView。

```swift
func showXibAlertView() {
    CustomAlertView.show(self) {
        print("closure")
    }
}
```

## 進階：回傳參數資料

![image](/images/posts/swift_alert_1630565230.png)


    如果需要回傳資料也很簡單，在typealias中添加參數資料即可

### step 1 AlertView

- 添加UITextField作為資料來源

```swift
class CustomAlertView: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var textfieldMessage: UITextField!
    
    @IBOutlet weak var btnDone: UIButton!
    
    typealias CompletionHandler = ((_ text: String) -> Void)
    var completionHandler:CompletionHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func donePressed(_ sender: Any) {
        // closure
        dismiss(animated: true) {
            if let handler = self.completionHandler {
                let msg = self.textfieldMessage.text ?? ""
                handler(msg)
            }
        }
    }
    
    func setupView() {
        lblTitle.text = "標題"
        textfieldMessage.placeholder = "文字訊息"
        btnDone.setTitle("確定", for: .normal)
    }
    
}

extension CustomAlertView {
    
    static func show(_ viewController:UIViewController,
                     doneHandler:@escaping CompletionHandler) {
        let page = CustomAlertView()
        page.modalPresentationStyle = .overFullScreen
        page.modalTransitionStyle = .crossDissolve
        page.completionHandler = doneHandler
        viewController.present(page, animated: true, completion: nil)
    }

}
```

### step 2 Use

```swift
func showXibAlertView() {
    CustomAlertView.show(self) { text in
        print(text)
    }
}
```
