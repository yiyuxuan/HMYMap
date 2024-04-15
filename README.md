
##  前述

1. 高德搜索Flutter插件
2. 登录[高德开放平台官网](https://lbs.amap.com/api/)分别申请[Android端](https://lbs.amap.com/api/android-location-sdk/guide/create-project/get-key/)和[iOS端](https://lbs.amap.com/api/ios-location-sdk/guide/create-project/get-key)的key
3. 如需了解高德搜索原生SDK的相关功能，请参阅[Android搜索SDK开发指南](https://lbs.amap.com/api/android-sdk/guide/map-data/poi)和[iOS搜索SDK开发指南](https://lbs.amap.com/api/ios-sdk/guide/map-data/poi)


## 使用高德搜索Flutter插件
* 请参考[在Flutter里使用Packages](https://flutter.cn/docs/development/packages-and-plugins/using-packages)， 引入amap_flutter_search插件

#### 安卓端配置
需要将keystore文件添加到项目中，并在build.gradle中添加签名,(如需运行example中项目，需自行修改)
```
    signingConfigs {
        debug {
            storeFile file("xxx") //keystore路径
            storePassword 'xx'
            keyAlias 'xx'
            keyPassword 'xx'
        }
        release {
            storeFile file("xx") //keystore路径
            storePassword 'xx'
            keyAlias 'xx'
            keyPassword 'xx'
        }
    }

```



### 在需要的搜索功能的页面中引入搜索Flutter插件的dart类
``` Dart

import 'package:amap_search/amap_search.dart';
```
## 接口说明

### 设置Android和iOS的apikey
``` Dart
  ///设置Android和iOS的apikey，建议在weigdet初始化时设置<br>
  ///apiKey的申请请参考高德开放平台官网<br>
  ///Android端: https://lbs.amap.com/api/android-location-sdk/guide/create-project/get-key<br>
  ///iOS端: https://lbs.amap.com/api/ios-location-sdk/guide/create-project/get-key<br>
  ///[androidKey] Android平台的key<br>
  ///[iosKey] ios平台的key<br>
  static void setApiKey(String androidKey, String iosKey)
```
> 隐私设置

``` Dart
  /// 设置是否已经包含高德隐私政策并弹窗展示显示用户查看，如果未包含或者没有弹窗展示，高德定位SDK将不会工作<br>
  /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy<br>
  /// <b>必须保证在调用定位功能之前调用， 建议首次启动App时弹出《隐私政策》并取得用户同意</b><br>
  /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy
  /// [hasContains] 隐私声明中是否包含高德隐私政策说明<br>
  /// [hasShow] 隐私权政策是否弹窗展示告知用户<br>
  static void updatePrivacyShow(bool hasContains, bool hasShow)

  /// 设置是否已经取得用户同意，如果未取得用户同意，高德定位SDK将不会工作<br>
  /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy<br>
  /// <b>必须保证在调用定位功能之前调用, 建议首次启动App时弹出《隐私政策》并取得用户同意</b><br>
  /// [hasAgree] 隐私权政策是否已经取得用户同意<br>
  static void updatePrivacyAgree(bool hasAgree)
```

### 出行路线规划：
* [x] 驾车出行路线规划
### 获取地图数据：
* [x] 关键字检索POI
* [x] 周边检索POI
* [x] 多边形内检索POI
* [x] 按ID检索POI
* [x] 道路沿途检索POI
* [x] 道路沿途多边形检索POI
* [x] 地理编码（地址转坐标）
* [x] 获取公交站点数据
* [x] 逆地理编码（坐标转地址）
### 工具：
* [x] 距离测量

以上相关功能请查看示例代码