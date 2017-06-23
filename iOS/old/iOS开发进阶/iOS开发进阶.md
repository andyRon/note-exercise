

### CocoaPods
- CocoaPods安装
- CocoaPods的镜像索引
    + Podspec文件： https://github.com/CocoaPods/Specs。也就在`~/.cocoapods/`
    + Podspec文件国内的两个镜像， 更换方式(具体地址需确认)
    ```
    pod repo remove master
    pod repo add master htts://gitcafe.com/akuandev/Specs.git
    pod repo update
    ```

- 使用
    + 新建Podfile，放入项目根目录（与*.xcodeproj同级）
    ```
    platform: ios
    pod 'JSONKit',  '~> 1.4'
    pod 'Reachability',     '~> 3.0.0'
    pod 'ASIHTTPRequest'
    pod 'RegexKitLite'
    ```
    + `pod install`
    + `pod update`  Podfile修改后使用
    + 使用*.xcworkspace重新打开项目

- Podfile.lock
- 为自己的项目创建podspec文件
- 使用私有的pods
- 不能信podspec
    + pod install 和 pod update默认会更新一次podspec索引，可以禁止：  
    `pod install --no-repo-update`
    `pod update --no-repo-update`
- 生成第三方库的帮助文档 `bre install appledoc`
- CocoaPods的原理

### Charles

### 界面调试工具 Reveal
