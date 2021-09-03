+++
author = "Tony Lin"
title = "[Swift]Array資料處理"
date = "2021-09-02 00:00:00"
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

整理一些基本常用的處理方式
<!--more-->

## 新增

```swift
var aryData = []
aryData.append("1")
aryData.append("2")
aryData.append("3")

print(aryData)
// Prints [1, 2, 3]
```

## 刪除

    注意：資料刪除後，index排序會重新整理，所以用「迴圈」刪除資料要小心。

```swift
aryData.remove(at: 0)
print(aryData)
// Prints [2, 3]
```

## 修改


## 資料排序

### 升序 A-Z

```swift
var histoayArray: [History] = []
historyArray.sorted(by: { $0.date < $1.date }
```

### 降序 Z-A

```swift
histoayArray.sort {
    $0.title > $1.title
}
```
