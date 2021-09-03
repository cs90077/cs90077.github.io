+++
author = "Tony Lin"
title = "[Swift]Attribute文字屬性的應用"
date = "2021-08-17 00:00:00"
categories = [
]
tags = [    
  "Swift",
  "Attribute",
]
series = [
  "iOS",
]
images = [
  
]
+++

調整各種文字屬性
<!--more-->

## 底線

- 按鈕添加底線

![image](/images/posts/swift_attribute_text_1.png)

```swift
@IBOutlet weak var partialDiscountButton: UIButton! {
    didSet {
        let title = "部分折抵"
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor.gray,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: title,
                                                        attributes: yourAttributes)
        partialDiscountButton.setAttributedTitle(attributeString, for: .normal)
    }
}
```