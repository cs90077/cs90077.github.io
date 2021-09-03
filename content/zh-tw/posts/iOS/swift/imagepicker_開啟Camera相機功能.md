+++
author = "Tony Lin"
title = "[Swift]使用ImagePicker開啟Camera相機功能"
date = "2020-09-06"
categories = [
]
tags = [
  "Swift",
  "ImagePicker",
  "Camera",  
]
series = [
  "iOS",
]
images = [
  
]
toc = true
+++

開啟相機 => 拍照 => 儲存照片 => 簡單搞定
<!--more-->

## 開啟相機拍照

### step 1 - 設定權限

###### info.plist

```swift
Privacy - Camera Usage Description
```

![camera](/images/posts/camera_1629421939.png)

### step 2 - 開啟相機

```swift
func openCamera() {
    let pickerController = UIImagePickerController()
    pickerController.delegate = self
    pickerController.mediaTypes = ["public.image"]
    pickerController.sourceType = .camera
    self.present(pickerController, animated: true, completion: nil)
}
```

> 如果要多錄影功能，請添加 public.movie 屬性

```swift
pickerController.mediaTypes = ["public.image", "public.movie"]
```

#### 效果

| 允許相機權限 | 相機頁面 | 拍照預覽頁面 |
:----:|:----:|:----:
![camera](/images/posts/camera_1629421949.png)  |  ![camera](/images/posts/camera_1629421950.png)|  ![camera](/images/posts/camera_1629421951.png)


### step 3 - 取得Image

```swift
extension OpenCameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        guard let originalImage = info[.originalImage] as? UIImage else { return }

        picker.dismiss(animated: true) {
            DispatchQueue.main.async() {
                self.previewImageView.image = originalImage
            }
        }
    }

}
```

| 拍照前 | 拍照後 |
:----:|:----:
![camera](/images/posts/camera_1629421952.png)  |  ![camera](/images/posts/camera_1629421953.png)| 


## 拍照後儲存照片

### step 1 - 設定權限

###### info.plist

```swift
Privacy - Photo Library Additions Usage Description
```

![camera](/images/posts/camera_1629422451.png)

### step 2 - 儲存圖片

```swift
func saveImageToPhotos() {
    // save
    UIImageWriteToSavedPhotosAlbum(mainImage, nil, nil, nil)
}
```

> 也可以在儲存成功後，顯示提醒視窗

```swift
func saveImageToPhotos() {
    // save
    UIImageWriteToSavedPhotosAlbum(mainImage, imageSaveSuccess(), nil, nil)
}

@objc func imageSaveSuccess(
    let alert = UIAlertController(title: "相片儲存", message: "成功", preferredStyle: .alert)
    alert.addAction(    UIAlertAction(title: "確認", style: .default, handler: ni)
    self.present(alert, animated: true, completion: nil)
}
```

| 設定權限 | 儲存照片 |
:----:|:----:
![camera](/images/posts/camera_1629422452.png)|![camera](/images/posts/camera_1629422453.png)



## Source

[Github](https://github.com/cs90077/Swift-Demo/tree/Tony_dev/ImagePicker-Demo)



