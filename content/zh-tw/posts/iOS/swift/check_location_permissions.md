+++
author = "Tony Lin"
title = "[Swift]檢查「允許取用位置」權限"
date = "2021-09-01 00:00:00"
categories = [
]
tags = [    
  "Swift",
  "Location",
]
series = [
  "iOS",
]
images = [
  "/images/posts/swift_location_1630474095.png"
]
+++

<!--more-->

|                       檢查權限                        |                    允許：下次詢問                     |
| :---------------------------------------------------: | :---------------------------------------------------: |
| ![image](/images/posts/swift_location_1630474095.png) | ![image](/images/posts/swift_location_1630474185.png) |


|                        不允許                         |                     再次請權限求                      |
| :---------------------------------------------------: | :---------------------------------------------------: |
| ![image](/images/posts/swift_location_1630474391.png) | ![image](/images/posts/swift_location_1630474096.png) |

## 權限

### step 1 permission

在 info.plist 添加權限項目

![image](/images/posts/swift_location_1630476077.png)

- Privacy - Location When In Use Usage Description
=> "定位權限將用於Wi-Fi連線與操作功能。請授權「APP」使用該權限。"

### step 2 import 

```swift
import CoreLocation
```

### step 3 manager

- 需將CLLocationManager參數放置全域變數，如果系統會抓不到最新資料，可能會出現重複詢問的狀況。

```swift
var locationManager : CLLocationManager = CLLocationManager()
```

### step 4 function

authorizationStatus類別
- denied：永不
- notDetermined：下次詢問
- authorizedWhenInUse：使用APP期間
- authorizedAlways：永遠
- restricted：受限制的（目前我還不清楚用途

```swift
@IBAction func donePressed(_ sender: Any) {
    checkLocationPermission()
}    

func checkLocationPermission() {
    
    let locationManager = locationManager
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
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
    
}
```


## 相關文章

- [[前往「系統設定」頁面]](/posts/ios/swift/url/goto_system_setting/)

- [[iOS14 位置權限新增「準確位置」項目]](/posts/ios/swift/check_location_permissions_ios14/)