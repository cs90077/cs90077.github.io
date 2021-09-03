+++
author = "Tony Lin"
title = "[Swift]使用Bundle取得info資料"
date = "2020-11-06 00:00:00"
categories = [
]
tags = [  
  "Swift",
  "Bundle",
]
series = [
  "iOS",
]
images = [
  
]
+++

想把一些重要的參數寫在info.plist設定檔裡，透過Bundle取出想要的資料
<!--more-->

## 設定檔

![image](/images/posts/swift_bundle_info_dictionary_1.png)

## 方法

- 透過Dictionary的方式，透過Key，取出對應的Value

```swift
class ServerConfig {
    static let SERVER_CONFIG: String = "Server Config"
    static let HOST: String = "host"
    static let PORT: String = "port"
    static let REALM_VERSION: String = "realmVersion"
    
    let host: String
    let port: String
    let realmVersion: String
    
    init(){
        let infoPlist = Bundle.main.infoDictionary
        let serverConfig = infoPlist![ServerConfig.SERVER_CONFIG] as? [String: String]
        self.host = serverConfig![ServerConfig.HOST]!
        self.port = serverConfig![ServerConfig.PORT]!
        self.realmVersion = serverConfig![ServerConfig.REALM_VERSION]!
    }    
}
```

