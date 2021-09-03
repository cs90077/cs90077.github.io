+++
author = "Tony Lin"
title = "[Swift]Attribute 客製化文字屬性"
date = "2021-08-17 08:00:00"
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
  "/images/posts/swift_attribute_text_2.png"
]
+++

調整奇耙的文字屬性設定
<!--more-->

## 修改特定文字顏色屬性

![image](/images/posts/swift_attribute_text_2.png)

```swift
var hours =19
var title = "你有 \(hours)分 可以折抵，要使用嗎？"

let range: Range<String.Index> = title.range(of:" ")!
let index: Int = title.distance(from: title.startIndex, to: range.lowerBound) + 1
let length: Int = hours.description.count + 1 // 包含 “分”

let attributedString = NSMutableAttributedString(string: title, attributes: [
    .font: UIFont(name: "PingFangTC-Regular", size: 14.0)!,
    .foregroundColor: UIColor.black,
    .kern: 0.0
])

attributedString.addAttributes([
    .font: UIFont(name: "PingFangTC-Medium", size: 14.0)!,
    .foregroundColor: UIColor.mainBlue
], range: NSRange(location: index, length: length))

subtitleLabel.attributedText = attributedString
```
