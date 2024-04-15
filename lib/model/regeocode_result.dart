import 'dart:convert';

import 'package:amap_search/model/models.dart';

class ReGeocodeResult {
  RegeocodeAddress? regeocodeAddress;
  RegeocodeQuery? regeocodeQuery;

  ReGeocodeResult({
    this.regeocodeAddress,
    this.regeocodeQuery,
  });

  ReGeocodeResult.fromJson(Map<String, dynamic> json) {
    regeocodeAddress = json['regeocodeAddress'] != null ? RegeocodeAddress.fromJson(json['regeocodeAddress']) : null;
    regeocodeQuery = json['regeocodeQuery'] != null ? RegeocodeQuery.fromJson(json['regeocodeQuery']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (regeocodeAddress != null) {
      data['regeocodeAddress'] = regeocodeAddress!.toJson();
    }
    if (regeocodeQuery != null) {
      data['regeocodeQuery'] = regeocodeQuery!.toJson();
    }
    return data;
  }

  ReGeocodeResult copyWith({
    RegeocodeAddress? regeocodeAddress,
    RegeocodeQuery? regeocodeQuery,
  }) {
    return ReGeocodeResult(
      regeocodeAddress: regeocodeAddress ?? this.regeocodeAddress,
      regeocodeQuery: regeocodeQuery ?? this.regeocodeQuery,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReGeocodeResult &&
          runtimeType == other.runtimeType &&
          regeocodeAddress == other.regeocodeAddress &&
          regeocodeQuery == other.regeocodeQuery;

  @override
  int get hashCode => regeocodeAddress.hashCode ^ regeocodeQuery.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class RegeocodeAddress {
  String? adCode;
  List<Aoi>? aois;
  String? building;
  List<BusinessAreas>? businessAreas;
  String? city;
  String? cityCode;
  String? country;
  List<Crossroad>? crossroads;
  String? district;
  String? formatAddress;
  String? neighborhood;
  List<PoiItem>? pois;
  String? province;
  List<Road>? roads;
  StreetNumber? streetNumber;
  String? towncode;
  String? township;

  RegeocodeAddress({
    this.adCode,
    this.aois,
    this.building,
    this.businessAreas,
    this.city,
    this.cityCode,
    this.country,
    this.crossroads,
    this.district,
    this.formatAddress,
    this.neighborhood,
    this.pois,
    this.province,
    this.roads,
    this.streetNumber,
    this.towncode,
    this.township,
  });

  RegeocodeAddress.fromJson(Map<String, dynamic> json) {
    adCode = json['adCode'] as String;
    if (json['aois'] != null) {
      aois = <Aoi>[];
      json['aois'].forEach((v) {
        aois!.add(Aoi.fromJson(v as Map<String, dynamic>));
      });
    }
    building = json['building'] as String;
    if (json['businessAreas'] != null) {
      businessAreas = <BusinessAreas>[];
      json['businessAreas'].forEach((v) {
        businessAreas!.add(BusinessAreas.fromJson(v as Map<String, dynamic>));
      });
    }
    city = json['city'] as String;
    cityCode = json['cityCode'] as String;
    country = json['country'] as String;
    if (json['crossroads'] != null) {
      crossroads = <Crossroad>[];
      json['crossroads'].forEach((v) {
        crossroads!.add(Crossroad.fromJson(v as Map<String, dynamic>));
      });
    }
    district = json['district'] as String;
    formatAddress = json['formatAddress'] as String;
    neighborhood = json['neighborhood'] as String;
    if (json['pois'] != null) {
      pois = <PoiItem>[];
      json['pois'].forEach((v) {
        pois!.add(PoiItem.fromJson(v as Map<String, dynamic>));
      });
    }
    province = json['province'] as String;
    if (json['roads'] != null) {
      roads = <Road>[];
      json['roads'].forEach((v) {
        roads!.add(Road.fromJson(v as Map<String, dynamic>));
      });
    }
    streetNumber = json['streetNumber'] != null ? StreetNumber.fromJson(json['streetNumber']) : null;
    towncode = json['towncode'] as String;
    township = json['township'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adCode'] = adCode;
    if (aois != null) {
      data['aois'] = aois!.map((v) => v.toJson()).toList();
    }
    data['building'] = building;
    if (businessAreas != null) {
      data['businessAreas'] = businessAreas!.map((v) => v.toJson()).toList();
    }
    data['city'] = city;
    data['cityCode'] = cityCode;
    data['country'] = country;
    if (crossroads != null) {
      data['crossroads'] = crossroads!.map((v) => v.toJson()).toList();
    }
    data['district'] = district;
    data['formatAddress'] = formatAddress;
    data['neighborhood'] = neighborhood;
    if (pois != null) {
      data['pois'] = pois!.map((v) => v.toJson()).toList();
    }
    data['province'] = province;
    if (roads != null) {
      data['roads'] = roads!.map((v) => v.toJson()).toList();
    }
    if (streetNumber != null) {
      data['streetNumber'] = streetNumber!.toJson();
    }
    data['towncode'] = towncode;
    data['township'] = township;
    return data;
  }

  RegeocodeAddress copyWith({
    String? adCode,
    List<Aoi>? aois,
    String? building,
    List<BusinessAreas>? businessAreas,
    String? city,
    String? cityCode,
    String? country,
    List<Crossroad>? crossroads,
    String? district,
    String? formatAddress,
    String? neighborhood,
    List<PoiItem>? pois,
    String? province,
    List<Road>? roads,
    StreetNumber? streetNumber,
    String? towncode,
    String? township,
  }) {
    return RegeocodeAddress(
      adCode: adCode ?? this.adCode,
      aois: aois ?? this.aois,
      building: building ?? this.building,
      businessAreas: businessAreas ?? this.businessAreas,
      city: city ?? this.city,
      cityCode: cityCode ?? this.cityCode,
      country: country ?? this.country,
      crossroads: crossroads ?? this.crossroads,
      district: district ?? this.district,
      formatAddress: formatAddress ?? this.formatAddress,
      neighborhood: neighborhood ?? this.neighborhood,
      pois: pois ?? this.pois,
      province: province ?? this.province,
      roads: roads ?? this.roads,
      streetNumber: streetNumber ?? this.streetNumber,
      towncode: towncode ?? this.towncode,
      township: township ?? this.township,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegeocodeAddress &&
          runtimeType == other.runtimeType &&
          adCode == other.adCode &&
          aois == other.aois &&
          building == other.building &&
          businessAreas == other.businessAreas &&
          city == other.city &&
          cityCode == other.cityCode &&
          country == other.country &&
          crossroads == other.crossroads &&
          district == other.district &&
          formatAddress == other.formatAddress &&
          neighborhood == other.neighborhood &&
          pois == other.pois &&
          province == other.province &&
          roads == other.roads &&
          streetNumber == other.streetNumber &&
          towncode == other.towncode &&
          township == other.township;

  @override
  int get hashCode =>
      adCode.hashCode ^
      aois.hashCode ^
      building.hashCode ^
      businessAreas.hashCode ^
      city.hashCode ^
      cityCode.hashCode ^
      country.hashCode ^
      crossroads.hashCode ^
      district.hashCode ^
      formatAddress.hashCode ^
      neighborhood.hashCode ^
      pois.hashCode ^
      province.hashCode ^
      roads.hashCode ^
      streetNumber.hashCode ^
      towncode.hashCode ^
      township.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class Aoi {
  String? adCode;
  num? aoiArea;
  LatLng? aoiCenterPoint;
  String? aoiId;
  String? aoiName;

  Aoi({
    this.adCode,
    this.aoiArea,
    this.aoiCenterPoint,
    this.aoiId,
    this.aoiName,
  });

  Aoi.fromJson(Map<String, dynamic> json) {
    adCode = json['adCode'] as String;
    aoiArea = json['aoiArea'] as num;
    aoiCenterPoint = json['aoiCenterPoint'] != null ? LatLng.fromJson(json['aoiCenterPoint']) : null;
    aoiId = json['aoiId'] as String;
    aoiName = json['aoiName'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adCode'] = adCode;
    data['aoiArea'] = aoiArea;
    if (aoiCenterPoint != null) {
      data['aoiCenterPoint'] = aoiCenterPoint!.toJson();
    }
    data['aoiId'] = aoiId;
    data['aoiName'] = aoiName;
    return data;
  }

  Aoi copyWith({
    String? adCode,
    num? aoiArea,
    LatLng? aoiCenterPoint,
    String? aoiId,
    String? aoiName,
  }) {
    return Aoi(
      adCode: adCode ?? this.adCode,
      aoiArea: aoiArea ?? this.aoiArea,
      aoiCenterPoint: aoiCenterPoint ?? this.aoiCenterPoint,
      aoiId: aoiId ?? this.aoiId,
      aoiName: aoiName ?? this.aoiName,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Aoi &&
          runtimeType == other.runtimeType &&
          adCode == other.adCode &&
          aoiArea == other.aoiArea &&
          aoiCenterPoint == other.aoiCenterPoint &&
          aoiId == other.aoiId &&
          aoiName == other.aoiName;

  @override
  int get hashCode => adCode.hashCode ^ aoiArea.hashCode ^ aoiCenterPoint.hashCode ^ aoiId.hashCode ^ aoiName.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class BusinessAreas {
  LatLng? centerPoint;
  String? name;

  BusinessAreas({
    this.centerPoint,
    this.name,
  });

  BusinessAreas.fromJson(Map<String, dynamic> json) {
    centerPoint = json['centerPoint'] != null ? LatLng.fromJson(json['centerPoint']) : null;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (centerPoint != null) {
      data['centerPoint'] = centerPoint!.toJson();
    }
    data['name'] = name;
    return data;
  }

  BusinessAreas copyWith({
    LatLng? centerPoint,
    String? name,
  }) {
    return BusinessAreas(
      centerPoint: centerPoint ?? this.centerPoint,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessAreas &&
          runtimeType == other.runtimeType &&
          centerPoint == other.centerPoint &&
          name == other.name;

  @override
  int get hashCode => centerPoint.hashCode ^ name.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class Crossroad {
  LatLng? centerPoint;
  String? direction;
  num? distance;
  String? firstRoadId;
  String? firstRoadName;
  String? id;
  num? roadWidth;
  String? secondRoadId;
  String? secondRoadName;

  Crossroad({
    this.centerPoint,
    this.direction,
    this.distance,
    this.firstRoadId,
    this.firstRoadName,
    this.id,
    this.roadWidth,
    this.secondRoadId,
    this.secondRoadName,
  });

  Crossroad.fromJson(Map<String, dynamic> json) {
    centerPoint = json['centerPoint'] != null ? LatLng.fromJson(json['centerPoint']) : null;
    direction = json['direction'] as String;
    distance = json['distance'] as num;
    firstRoadId = json['firstRoadId'] as String;
    firstRoadName = json['firstRoadName'] as String;
    id = json['id'] as String;
    roadWidth = json['roadWidth'] as num;
    secondRoadId = json['secondRoadId'] as String;
    secondRoadName = json['secondRoadName'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (centerPoint != null) {
      data['centerPoint'] = centerPoint!.toJson();
    }
    data['direction'] = direction;
    data['distance'] = distance;
    data['firstRoadId'] = firstRoadId;
    data['firstRoadName'] = firstRoadName;
    data['id'] = id;
    data['roadWidth'] = roadWidth;
    data['secondRoadId'] = secondRoadId;
    data['secondRoadName'] = secondRoadName;
    return data;
  }

  Crossroad copyWith({
    LatLng? centerPoint,
    String? direction,
    num? distance,
    String? firstRoadId,
    String? firstRoadName,
    String? id,
    num? roadWidth,
    String? secondRoadId,
    String? secondRoadName,
  }) {
    return Crossroad(
      centerPoint: centerPoint ?? this.centerPoint,
      direction: direction ?? this.direction,
      distance: distance ?? this.distance,
      firstRoadId: firstRoadId ?? this.firstRoadId,
      firstRoadName: firstRoadName ?? this.firstRoadName,
      id: id ?? this.id,
      roadWidth: roadWidth ?? this.roadWidth,
      secondRoadId: secondRoadId ?? this.secondRoadId,
      secondRoadName: secondRoadName ?? this.secondRoadName,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Crossroad &&
          runtimeType == other.runtimeType &&
          centerPoint == other.centerPoint &&
          direction == other.direction &&
          distance == other.distance &&
          firstRoadId == other.firstRoadId &&
          firstRoadName == other.firstRoadName &&
          id == other.id &&
          roadWidth == other.roadWidth &&
          secondRoadId == other.secondRoadId &&
          secondRoadName == other.secondRoadName;

  @override
  int get hashCode =>
      centerPoint.hashCode ^
      direction.hashCode ^
      distance.hashCode ^
      firstRoadId.hashCode ^
      firstRoadName.hashCode ^
      id.hashCode ^
      roadWidth.hashCode ^
      secondRoadId.hashCode ^
      secondRoadName.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class Road {
  String? direction;
  num? distance;
  String? id;
  LatLng? latLngPoint;
  String? name;

  Road({
    this.direction,
    this.distance,
    this.id,
    this.latLngPoint,
    this.name,
  });

  Road.fromJson(Map<String, dynamic> json) {
    direction = json['direction'] as String;
    distance = json['distance'] as num;
    id = json['id'] as String;
    latLngPoint = json['latLngPoint'] != null ? LatLng.fromJson(json['latLngPoint']) : null;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['direction'] = direction;
    data['distance'] = distance;
    data['id'] = id;
    if (latLngPoint != null) {
      data['latLngPoint'] = latLngPoint!.toJson();
    }
    data['name'] = name;
    return data;
  }

  Road copyWith({
    String? direction,
    num? distance,
    String? id,
    LatLng? latLngPoint,
    String? name,
  }) {
    return Road(
      direction: direction ?? this.direction,
      distance: distance ?? this.distance,
      id: id ?? this.id,
      latLngPoint: latLngPoint ?? this.latLngPoint,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Road &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          distance == other.distance &&
          id == other.id &&
          latLngPoint == other.latLngPoint &&
          name == other.name;

  @override
  int get hashCode => direction.hashCode ^ distance.hashCode ^ id.hashCode ^ latLngPoint.hashCode ^ name.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class StreetNumber {
  String? direction;
  num? distance;
  LatLng? latLonPoint;
  String? number;
  String? street;

  StreetNumber({
    this.direction,
    this.distance,
    this.latLonPoint,
    this.number,
    this.street,
  });

  StreetNumber.fromJson(Map<String, dynamic> json) {
    direction = json['direction'] as String;
    distance = json['distance'] as num;
    latLonPoint = json['latLonPoint'] != null ? LatLng.fromJson(json['latLonPoint']) : null;
    number = json['number'] as String;
    street = json['street'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['direction'] = direction;
    data['distance'] = distance;
    if (latLonPoint != null) {
      data['latLonPoint'] = latLonPoint!.toJson();
    }
    data['number'] = number;
    data['street'] = street;
    return data;
  }

  StreetNumber copyWith({
    String? direction,
    num? distance,
    LatLng? latLonPoint,
    String? number,
    String? street,
  }) {
    return StreetNumber(
      direction: direction ?? this.direction,
      distance: distance ?? this.distance,
      latLonPoint: latLonPoint ?? this.latLonPoint,
      number: number ?? this.number,
      street: street ?? this.street,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreetNumber &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          distance == other.distance &&
          latLonPoint == other.latLonPoint &&
          number == other.number &&
          street == other.street;

  @override
  int get hashCode => direction.hashCode ^ distance.hashCode ^ latLonPoint.hashCode ^ number.hashCode ^ street.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class RegeocodeQuery {
  String? latLonType;
  String? poiType;
  LatLng? point;
  num? radius;

  RegeocodeQuery({
    this.latLonType,
    this.poiType,
    this.point,
    this.radius,
  });

  RegeocodeQuery.fromJson(Map<String, dynamic> json) {
    latLonType = json['latLonType'] as String;
    poiType = json['poiType'] as String;
    point = json['point'] != null ? LatLng.fromJson(json['point']) : null;
    radius = json['radius'] as num;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latLonType'] = latLonType;
    data['poiType'] = poiType;
    if (point != null) {
      data['point'] = point!.toJson();
    }
    data['radius'] = radius;
    return data;
  }

  RegeocodeQuery copyWith({
    String? latLonType,
    String? poiType,
    LatLng? point,
    num? radius,
  }) {
    return RegeocodeQuery(
      latLonType: latLonType ?? this.latLonType,
      poiType: poiType ?? this.poiType,
      point: point ?? this.point,
      radius: radius ?? this.radius,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegeocodeQuery &&
          runtimeType == other.runtimeType &&
          latLonType == other.latLonType &&
          poiType == other.poiType &&
          point == other.point &&
          radius == other.radius;

  @override
  int get hashCode => latLonType.hashCode ^ poiType.hashCode ^ point.hashCode ^ radius.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}
