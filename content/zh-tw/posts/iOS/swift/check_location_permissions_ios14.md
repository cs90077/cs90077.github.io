+++
author = "Tony Lin"
title = "[Swift]iOS14 位置權限新增「準確位置」項目"
date = "2021-09-01 00:00:00"
categories = [
]
tags = [    
  "Swift",
  "Location",
  "iOS 14",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_location_1630475350.png"
]
+++

會發現這個是因為APP有需要使用到Wi-Fi功能，但當使用者把「準確位置」關閉之後，APP將無法取得Wi-Fi相關資訊，這樣就變得很麻煩，所以必須引導使用者，強制開啟位置權限的「準確位置」項目，才能讓我正常取用Wi-Fi資訊。
<!--more-->

將準確位置關閉的話，就會變成模糊定位。

    ps.最快的解決方法就是：公司要好好地告訴使用者，正確的使用規則！


|                     準確位置：關                      |                       檢查權限                        |
| :---------------------------------------------------: | :---------------------------------------------------: |
| ![image](/images/posts/swift_location_1630475347.png) | ![image](/images/posts/swift_location_1630475350.png) |



### step 1 permission

在 info.plist 添加權限項目

![image](/images/posts/swift_location_1630476078.png)

- Privacy - Location Always and When In Use Usage Description
=>"開啟取用位置及準確位置等權限，即可使用Wi-Fi功能。請授權「APP」使用該權限。"

## step 2 function

```swift
func checkAppPermission() {
    
    let locationManager = locationManager
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
    //        locationManager.allowsBackgroundLocationUpdates = true
    locationManager.pausesLocationUpdatesAutomatically = false
    
    // 第一次安裝為未授權
    if CLLocationManager.authorizationStatus() == .notDetermined {
        // 系統內建權限詢問視窗
        locationManager.requestWhenInUseAuthorization()
    }
    else if CLLocationManager.authorizationStatus() == .restricted {
        // 系統內建權限詢問視窗
        locationManager.requestWhenInUseAuthorization()
    }
    else if CLLocationManager.authorizationStatus() == .denied {
        let alertViewController = UIAlertController (
            title: "權限請求",
            message: "定位權限將用XXX作功能。請授權「APP」使用該權限。",
            preferredStyle: .alert)
        
        let uploadAction = UIAlertAction(
            title: "設定",
            style: .destructive,
            handler: {_ in
                
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            })
        
        alertViewController.addAction(uploadAction)
        
        self.present(alertViewController, animated: true, completion: nil)
    }
    else {
        if #available(iOS 14.0, *) {
            // iOS 14 新增了「準確位置」功能
            switch locationManager.accuracyAuthorization {
            case .reducedAccuracy:
                print("approximate location")
                
                let alertViewController = UIAlertController(
                    title: "權限請求",
                    message: "請開啟準確位置，「APP」才能使用WI-FI連線功能。",
                    preferredStyle: .alert)
                
                let uploadAction = UIAlertAction(
                    title: "設定",
                    style: .destructive,
                    handler: {_ in
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    })
                
                alertViewController.addAction(uploadAction)
                
                self.present(alertViewController, animated: true, completion: nil)
                
                locationManager.startUpdatingLocation()
            case .fullAccuracy:
                print("accurate location")
            @unknown default:
                print("unknown type")
            }
        }
    }
    
}
```

## 參考

- [[定位服務與隱私權]](https://support.apple.com/zh-tw/HT207056)

- [[關於 iOS 與 iPadOS 的隱私權和定位服務]](https://support.apple.com/zh-tw/HT203033#footnotes)

## 相關文章

- [[前往「系統設定」頁面]](/posts/ios/swift/url/goto_system_setting/)

- [[檢查「允許取用位置」權限]](/posts/ios/swift/check_location_permissions/)
