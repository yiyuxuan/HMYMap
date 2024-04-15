import 'dart:convert';
import 'dart:io';

import 'package:amap_search/common/log.dart';
import 'package:amap_search/model/models.dart';
import 'package:flutter/services.dart';

typedef ResultGenerator<T> = T Function(dynamic json);

class AMapSearch {
  static const _searchChannel = MethodChannel('com.github.hugochou.amap_search');

  static T _jsonToModel<T>(dynamic jsonString, ResultGenerator<T> generator) {
    try {
      dynamic temp = jsonDecode(jsonString as String);
      return generator(temp);
    } catch (e) {
      throw jsonString;
    }
  }

  ///设置Android和iOS的apikey，建议在weigdet初始化时设置<br>
  ///apiKey的申请请参考高德开放平台官网<br>
  ///Android端: https://lbs.amap.com/api/android-location-sdk/guide/create-project/get-key<br>
  ///iOS端: https://lbs.amap.com/api/ios-location-sdk/guide/create-project/get-key<br>
  ///[androidKey] Android平台的key<br>
  ///[iosKey] ios平台的key<br>
  static Future setApiKey(String androidKey, String iosKey) {
    return _searchChannel.invokeMethod('setApiKey', {'android': androidKey, 'ios': iosKey});
  }

  /// 设置是否已经包含高德隐私政策并弹窗展示显示用户查看，如果未包含或者没有弹窗展示，高德定位SDK将不会工作<br>
  /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy<br>
  /// <b>必须保证在调用定位功能之前调用， 建议首次启动App时弹出《隐私政策》并取得用户同意</b><br>
  /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy
  /// [hasContains] 隐私声明中是否包含高德隐私政策说明<br>
  /// [hasShow] 隐私权政策是否弹窗展示告知用户<br>
  static Future updatePrivacyShow(bool hasContains, bool hasShow) {
    return _searchChannel.invokeMethod('updatePrivacyStatement', {'hasContains': hasContains, 'hasShow': hasShow});
  }

  /// 设置是否已经取得用户同意，如果未取得用户同意，高德定位SDK将不会工作<br>
  /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy<br>
  /// <b>必须保证在调用定位功能之前调用, 建议首次启动App时弹出《隐私政策》并取得用户同意</b><br>
  /// [hasAgree] 隐私权政策是否已经取得用户同意<br>
  static Future updatePrivacyAgree(bool hasAgree) {
    return _searchChannel.invokeMethod('updatePrivacyStatement', {'hasAgree': hasAgree});
  }

  /// 搜索poi
  static Future<PoiResult> searchPoi(PoiSearchQuery query) {
    L.p('方法searchPoi dart端参数: query.toJsonString() -> ${query.toJsonString()}');

    return _searchChannel.invokeMethod('searchPoi', {'query': query.toJsonString()}).then(
        (result) {
          return _jsonToModel(result, (json) {
            return PoiResult.fromJson(json);
          });
        });
  }

  /// 搜索poi 周边搜索
  static Future<PoiResult> searchPoiBound(PoiSearchQuery query) {
    L.p('searchPoiBound dart端参数: query.toJsonString() -> ${query.toJsonString()}');

    return _searchChannel.invokeMethod('searchPoiBound', {'query': query.toJsonString()}).then(
        (result) => _jsonToModel(result, (json) => PoiResult.fromJson(json)));
  }

  /// 搜索poi 多边形搜索
  static Future<PoiResult> searchPoiPolygon(PoiSearchQuery query) {
    L.p('searchPoiPolygon dart端参数: query.toJsonString() -> ${query.toJsonString()}');

    return _searchChannel.invokeMethod('searchPoiPolygon', {'query': query.toJsonString()}).then(
        (result) => _jsonToModel(result, (json) => PoiResult.fromJson(json)));
  }

  /// 按id搜索poi
  static Future<PoiItem> searchPoiId(String id) {
    L.p('searchPoiId dart端参数: id -> $id');

    return _searchChannel.invokeMethod(
        'searchPoiId', {'id': id}).then((result) => _jsonToModel(result, (json) => PoiItem.fromJson(json)));
  }

  /// 道路沿途直线检索POI
  static Future<RoutePoiResult> searchRoutePoiLine(RoutePoiSearchQuery query) {
    L.p('searchRoutePoiLine dart端参数: query.toJsonString() -> ${query.toJsonString()}');

    return _searchChannel.invokeMethod('searchRoutePoiLine', {'query': query.toJsonString()}).then(
        (result) => _jsonToModel(result, (json) => RoutePoiResult.fromJson(json)));
  }

  /// 道路沿途多边形检索POI
  static Future<RoutePoiResult> searchRoutePoiPolygon(RoutePoiSearchQuery query) {
    L.p('searchRoutePoiPolygon dart端参数: query.toJsonString() -> ${query.toJsonString()}');

    return _searchChannel.invokeMethod('searchRoutePoiPolygon', {'query': query.toJsonString()}).then(
        (result) => _jsonToModel(result, (json) => RoutePoiResult.fromJson(json)));
  }

  /// 计算驾驶路线
  static Future<DriveRouteResult> calculateDriveRoute(RoutePlanParam param) {
    final routePlanParam = param.toJsonString();
    L.p('方法calculateDriveRoute dart端参数: _routePlanParam -> $routePlanParam');
    return _searchChannel.invokeMethod(
      'calculateDriveRoute',
      {'routePlanParam': routePlanParam},
    ).then((result) => _jsonToModel(result, (json) => DriveRouteResult.fromJson(json)));
  }

  /// 地址转坐标 [name]表示地址，第二个参数表示查询城市，中文或者中文全拼，citycode、adcode
  static Future<GeocodeResult> searchGeocode(String name, String city) {
    L.p('方法searchGeocode dart端参数: name -> $name, cityCode -> $city');

    return _searchChannel.invokeMethod(
      'searchGeocode',
      {'name': name, 'city': city},
    ).then((result) => _jsonToModel(result, (json) => GeocodeResult.fromJson(json)));
  }

  /// 逆地理编码（坐标转地址）
  static Future<ReGeocodeResult> searchReGeocode(
    LatLng point,
    double radius,
    int latLonType,
  ) {
    L.p('方法searchReGeocode dart端参数: point -> ${point.toJsonString()}, radius -> $radius, latLonType -> $latLonType');

    return _searchChannel.invokeMethod(
      'searchReGeocode',
      {
        'point': point.toJsonString(),
        'radius': radius,
        'latLonType': latLonType,
      },
    ).then((result) => _jsonToModel(result, (json) => ReGeocodeResult.fromJson(json)));
  }

  /// 距离测量 参考[链接](https://lbs.amap.com/api/android-sdk/guide/computing-equipment/distancesearch)
  ///
  /// type 分别对应
  static Future<List<int>> distanceSearch(List<LatLng> origins, LatLng target, DistanceSearchType type) async {
    List<Map<String, Object>> oriList = [];

    origins.forEach((o) {
      oriList.add(o.toJson());
    });

    Map<String, dynamic> params = {
      "origin": oriList,
      "target": target.toJson(),
      "type": DistanceSearchType.values.indexOf(type),
    };

    List<dynamic> result = await _searchChannel.invokeMethod("distanceSearch", params);
    return result.map((v) => v as int).toList();
  }

  /// 公交站点查询
  ///
  /// [stationName] 公交站点名
  /// [city] 所在城市名或者城市区号
  static Future<BusStationResult?> searchBusStation(String stationName, String city) {
    L.p('方法searchBusStation dart端参数: stationName -> $stationName, city -> $city');

    return _searchChannel.invokeMethod(
      'searchBusStation',
      {'stationName': stationName, 'city': city},
    )
        // .then((result) => result as String)
        .then((result) {
      if (Platform.isIOS) {
        return _jsonToModel(result, (json) => BusStationResult.ios(BusStationResult_iOS.fromJson(json)));
        // return BusStationResult.ios(BusStationResult_iOS.fromJson(jsonDecode(json)));
      } else if (Platform.isAndroid) {
        return _jsonToModel(result, (json) => BusStationResult.fromJson(json));
        // return BusStationResult.fromJson(jsonDecode(json));
      } else {
        return null;
      }
    });
  }
}

enum DistanceSearchType {
  line,
  driver,
}
