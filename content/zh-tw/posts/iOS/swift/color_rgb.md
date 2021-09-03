+++
author = "Tony Lin"
title = "[Swift]UIColor RGB顏色的使用"
date = "2021-06-06"
categories = [
]
tags = [  
  "Swift",
  "UIColor",  
]
series = [
  "iOS",
]
images = [
  
]
+++

<!--more-->

[色碼轉換器](https://www.peko-step.com/zhtw/tool/tfcolor.html)
- 將 RGB 轉換成 HEX
- 將 HEX 轉換成 RGB

## 使用RGB

```swift
UIColor(red: 120.0 / 255.0, green: 125 / 255.0, blue: 112.0 / 255.0, alpha: 1)
```

### Extension

```swift
extension UIColor {
    
    static func RGBA(r: Float, g: Float , b: Float , a: Float) -> UIColor
    {
        return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: CGFloat(a))
    }

}

// use
let greyColor =  UIColor.RGBA(r: 88, g: 91, b: 96, a: 1)
```


## 使用Asset

### Add Color Set

![image](/images/posts/swift_color_rgb_1.png)

- 設定使用Hex

![image](/images/posts/swift_color_rgb_2.png)

- 設定使用RGB

![image](/images/posts/swift_color_rgb_3.png)

### Extension

```swift

extension UIColor {
    
    @nonobjc class var black70: UIColor {
        return UIColor(red: 19.0 / 255.0, green: 20.0 / 255.0, blue: 21.0 / 255.0, alpha: 0.6)
    }

}

// use
var black70 = UIColor(named: "black70")

black70 = UIColor.black70

black70 = .black70
```
