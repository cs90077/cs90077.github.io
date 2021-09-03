+++
author = "Tony Lin"
title = "[Swift]Array取得不重複資料"
date = "2021-08-01 00:00:00"
categories = [
]
tags = [    
  "Swift",
  "Array",
]
series = [
  "iOS",
]
images = [
  
]
+++

當資料有重複，想整理出不重複的資料，以下提供兩種方式給大家參考！
<!--more-->

### 傳統方法：使用for迴圈

```Swift
let array = [100, 200, 300 , 400 , 500, 100]  
// Prints [100, 200, 300, 400, 500, 100]
var newArray: [Int] = []

for value in array {
    if (newArray.contains(value)) {
        continue
    }
    newArray.append(value)
}

print(newArray)
// Prints [100, 200, 300, 400, 500]
```
    
### 進階方法：使用Filter函式

```Swift
extension Array where Element: Hashable {

    func removeDuplicateElement() -> [Element] {
        var elementSet = Set()

        return filter {
            elementSet.update(with: $0) == nil
        }
    }
}

let array = [100, 200, 300 , 400 , 500, 100]
// Prints [100, 200, 300, 400, 500, 100]
let newArray = array.removeDuplicateElement()

print(newArray)
// Prints [100, 200, 300, 400, 500]
```
