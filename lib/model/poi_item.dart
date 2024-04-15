import 'dart:convert';

import 'package:amap_search/model/models.dart';

class PoiItem {
  /// POI全局唯一ID [Android, iOS]
  String? poiId;

  /// 区域编码 [Android, iOS]
  String? adCode;

  /// 区域名称 [Android, iOS]
  String? adName;

  /// 所在商圈 [Android, iOS]
  String? businessArea;

  /// 城市编码 [Android, iOS]
  String? cityCode;

  /// 城市名称 [Android, iOS]
  String? cityName;

  /// 方向 [Android, iOS]
  String? direction;

  /// 距中心点的距离，单位米。在周边搜索时有效 [Android, iOS]
  int? distance;

  /// 电子邮件 [Android, iOS]
  String? email;

  /// 室内信息 [Android, iOS]
  IndoorData? indoorData;

  /// 是否有室内地图 [Android, iOS]
  bool? isIndoorMap;

  /// 经纬度 [Android, iOS]
  LatLng? latLonPoint;

  /// 入口经纬度 [Android, iOS]
  LatLng? enter;

  /// 出口经纬度 [Android, iOS]
  LatLng? exit;

  /// 停车场类型，地上、地下、路边 [Android, iOS]
  String? parkingType;

  /// 图片列表 [Android, iOS]
  List<Photo>? photos;

  /// 扩展信息 只有在ID查询时有效 [Android, iOS]
  PoiExtension? poiExtension;

  /// 邮编 [Android, iOS]
  String? postcode;

  /// 省编码 [Android, iOS]
  String? provinceCode;

  /// 省 [Android, iOS]
  String? provinceName;

  /// 商铺id [Android, iOS]
  String? shopID;

  /// 地址 [Android, iOS]
  String? snippet;

  /// 子POI列表 [Android, iOS]
  List<SubPoiItem>? subPois;

  /// 电话 [Android, iOS]
  String? tel;

  /// 名称 [Android, iOS]
  String? title;

  /// 类型编码 [Android, iOS]
  String? typeCode;

  /// 兴趣点类型 [Android, iOS]
  String? typeDes;

  /// 网址 [Android, iOS]
  String? website;

  /// 地理格ID [iOS]
  String? gridCode;

  PoiItem({
    this.adCode,
    this.adName,
    this.businessArea,
    this.cityCode,
    this.cityName,
    this.direction,
    this.distance,
    this.email,
    this.indoorData,
    this.isIndoorMap,
    this.latLonPoint,
    this.enter,
    this.exit,
    this.parkingType,
    this.photos,
    this.poiExtension,
    this.poiId,
    this.postcode,
    this.provinceCode,
    this.provinceName,
    this.shopID,
    this.snippet,
    this.subPois,
    this.tel,
    this.title,
    this.typeCode,
    this.typeDes,
    this.website,
    this.gridCode,
  });

  PoiItem.fromJson(Map<String, dynamic> json) {
    adCode = json['adCode'] as String;
    adName = json['adName'] as String;
    businessArea = json['businessArea'] as String;
    cityCode = json['cityCode'] as String;
    cityName = json['cityName'] as String;
    direction = json['direction'] as String;
    distance = json['distance'] as int;
    email = json['email'] as String;
    indoorData = json['indoorData'] != null ? IndoorData.fromJson(json['indoorData']) : null;
    isIndoorMap = json['isIndoorMap'] as bool;
    latLonPoint = json['latLonPoint'] != null ? LatLng.fromJson(json['latLonPoint']) : null;
    enter = json['enter'] != null ? LatLng.fromJson(json['enter']) : null;
    exit = json['exit'] != null ? LatLng.fromJson(json['exit']) : null;
    parkingType = json['parkingType'] as String;
    if (json['photos'] != null) {
      photos = <Photo>[];
      json['photos'].forEach((v) {
        photos!.add(Photo.fromJson(v as Map<String, dynamic>));
      });
    }
    poiExtension = json['poiExtension'] != null ? PoiExtension.fromJson(json['poiExtension']) : null;
    poiId = json['poiId'] as String;
    postcode = json['postcode'] as String;
    provinceCode = json['provinceCode'] as String;
    provinceName = json['provinceName'] as String;
    shopID = json['shopID'] as String;
    snippet = json['snippet'] as String;
    if (json['subPois'] != null) {
      subPois = <SubPoiItem>[];
      json['subPois'].forEach((v) {
        subPois!.add(SubPoiItem.fromJson(v as Map<String, dynamic>));
      });
    }
    tel = json['tel'] as String;
    title = json['title'] as String;
    typeCode = json['typeCode'] as String;
    typeDes = json['typeDes'] as String;
    website = json['website'] as String;

    if (gridCode != null) {
      gridCode = json['gridCode'] as String;
    }

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adCode'] = adCode;
    data['adName'] = adName;
    data['businessArea'] = businessArea;
    data['cityCode'] = cityCode;
    data['cityName'] = cityName;
    data['direction'] = direction;
    data['distance'] = distance;
    data['email'] = email;
    if (indoorData != null) {
      data['indoorData'] = indoorData!.toJson();
    }
    data['isIndoorMap'] = isIndoorMap;
    if (latLonPoint != null) {
      data['latLonPoint'] = latLonPoint!.toJson();
    }
    if (enter != null) {
      data['enter'] = enter!.toJson();
    }
    if (exit != null) {
      data['exit'] = exit!.toJson();
    }
    data['parkingType'] = parkingType;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    if (poiExtension != null) {
      data['poiExtension'] = poiExtension!.toJson();
    }
    data['poiId'] = poiId;
    data['postcode'] = postcode;
    data['provinceCode'] = provinceCode;
    data['provinceName'] = provinceName;
    data['shopID'] = shopID;
    data['snippet'] = snippet;
    if (subPois != null) {
      data['subPois'] = subPois!.map((v) => v.toJson()).toList();
    }
    data['tel'] = tel;
    data['title'] = title;
    data['typeCode'] = typeCode;
    data['typeDes'] = typeDes;
    data['website'] = website;
    data['gridCode'] = gridCode;
    return data;
  }

  PoiItem copyWith({
    String? adCode,
    String? adName,
    String? businessArea,
    String? cityCode,
    String? cityName,
    String? direction,
    int? distance,
    String? email,
    IndoorData? indoorData,
    bool? isIndoorMap,
    LatLng? latLonPoint,
    LatLng? enter,
    LatLng? exit,
    String? parkingType,
    List<Photo>? photos,
    PoiExtension? poiExtension,
    String? poiId,
    String? postcode,
    String? provinceCode,
    String? provinceName,
    String? shopID,
    String? snippet,
    List<SubPoiItem>? subPois,
    String? tel,
    String? title,
    String? typeCode,
    String? typeDes,
    String? website,
    String? gridCode,
  }) {
    return PoiItem(
      adCode: adCode ?? this.adCode,
      adName: adName ?? this.adName,
      businessArea: businessArea ?? this.businessArea,
      cityCode: cityCode ?? this.cityCode,
      cityName: cityName ?? this.cityName,
      direction: direction ?? this.direction,
      distance: distance ?? this.distance,
      email: email ?? this.email,
      indoorData: indoorData ?? this.indoorData,
      isIndoorMap: isIndoorMap ?? this.isIndoorMap,
      latLonPoint: latLonPoint ?? this.latLonPoint,
      enter: enter ?? this.enter,
      exit: exit ?? this.exit,
      parkingType: parkingType ?? this.parkingType,
      photos: photos ?? this.photos,
      poiExtension: poiExtension ?? this.poiExtension,
      poiId: poiId ?? this.poiId,
      postcode: postcode ?? this.postcode,
      provinceCode: provinceCode ?? this.provinceCode,
      provinceName: provinceName ?? this.provinceName,
      shopID: shopID ?? this.shopID,
      snippet: snippet ?? this.snippet,
      subPois: subPois ?? this.subPois,
      tel: tel ?? this.tel,
      title: title ?? this.title,
      typeCode: typeCode ?? this.typeCode,
      typeDes: typeDes ?? this.typeDes,
      website: website ?? this.website,
      gridCode: gridCode ?? this.gridCode,
    );
  }

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}
