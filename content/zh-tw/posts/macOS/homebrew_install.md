+++
author = "Tony Lin"
title = "Homebrew macOS套件管理工具"
date = "2018-01-01 00:00:00"
categories = [
]
tags = [ 
  
]
series = [
  "macOS",
]
images = [
  
]
+++

<!--more-->

## 安裝

### 在intel安裝

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 在Apple Silicon安裝

    m1與install系統架構的目錄不同
    主要就是前綴詞加上 arch -x86_64

```shell
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### 更新

```shell
brew update && brew upgrade && brew cleanup
```

## 連結
[[Homebrew 官網]](https://brew.sh/index_zh-tw.html)