import 'dart:convert';

import 'bus_station_result.ios.dart';
import 'latlng.dart';
import 'suggestion_city.dart';

class BusStationResult {
  List<BusStation>? busStations;
  int? pageCount;
  Query? query;
  List<SuggestionCity>? searchSuggestionCities;
  List<String>? searchSuggestionKeywords;

  BusStationResult({
    this.busStations,
    this.pageCount,
    this.query,
    this.searchSuggestionCities,
    this.searchSuggestionKeywords,
  });

  BusStationResult.ios(BusStationResult_iOS result) {
    busStations = result.busstops?.map((stop) {
      return BusStation(
        adCode: stop.adcode,
        busLineItems: stop.buslines?.map((busline) {
          return BusLineItem(
            basicPrice: busline.basicPrice?.toDouble(),
            busLineId: busline.uid,
            busLineName: busline.name,
            busLineType: busline.type,
            cityCode: busline.citycode,
            distance: busline.distance?.toDouble(),
            originatingStation: busline.startStop,
            terminalStation: busline.endStop,
            totalPrice: busline.totalPrice?.toDouble(),
          );
        }).toList(),
        busStationId: stop.uid,
        busStationName: stop.name,
        cityCode: stop.citycode,
        latLng: stop.location,
      );
    }).toList();
    pageCount = result.count;
//    searchSuggestionCities = result.suggestion.cities?.map((city) {
//      return SuggestionCity(
//        cityName: city.city,
//        cityCode: city.citycode,
//        adCode: city.adcode,
//        suggestionNum: city.num,
//        districts: city.districts?.map((district) {
//          return District(
//
//          );
//        });
//      );
//    });
    searchSuggestionKeywords = result.suggestion?.keywords;
  }

  BusStationResult.fromJson(Map<String, dynamic> json) {
    if (json['busStations'] != null) {
      busStations = <BusStation>[];
      json['busStations'].forEach((v) {
        busStations!.add(BusStation.fromJson(v as Map<String, dynamic>));
      });
    }
    pageCount = json['pageCount'] as int;
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
    if (json['searchSuggestionCities'] != null) {
      searchSuggestionCities = <SuggestionCity>[];
      json['searchSuggestionCities'].forEach((v) {
        searchSuggestionCities!.add(SuggestionCity.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['searchSuggestionKeywords'] != null) {
      searchSuggestionKeywords = <String>[];
      json['searchSuggestionKeywords'].forEach((v) {
        searchSuggestionKeywords!.add(v as String);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (busStations != null) {
      data['busStations'] = busStations!.map((v) => v.toJson()).toList();
    }
    data['pageCount'] = pageCount;
    if (query != null) {
      data['query'] = query!.toJson();
    }
    if (searchSuggestionCities != null) {
      data['searchSuggestionCities'] = searchSuggestionCities!.map((v) => v.toJson()).toList();
    }
    if (searchSuggestionKeywords != null) {
      data['searchSuggestionKeywords'] = searchSuggestionKeywords;
    }
    return data;
  }

  BusStationResult copyWith({
    List<BusStation>? busStations,
    int? pageCount,
    Query? query,
    List<SuggestionCity>? searchSuggestionCities,
    List<String>? searchSuggestionKeywords,
  }) {
    return BusStationResult(
      busStations: busStations ?? this.busStations,
      pageCount: pageCount ?? this.pageCount,
      query: query ?? this.query,
      searchSuggestionCities: searchSuggestionCities ?? this.searchSuggestionCities,
      searchSuggestionKeywords: searchSuggestionKeywords ?? this.searchSuggestionKeywords,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusStationResult &&
          runtimeType == other.runtimeType &&
          busStations == other.busStations &&
          pageCount == other.pageCount &&
          query == other.query &&
          searchSuggestionCities == other.searchSuggestionCities &&
          searchSuggestionKeywords == other.searchSuggestionKeywords;

  @override
  int get hashCode =>
      busStations.hashCode ^
      pageCount.hashCode ^
      query.hashCode ^
      searchSuggestionCities.hashCode ^
      searchSuggestionKeywords.hashCode;

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class BusStation {
  String? adCode;
  List<BusLineItem>? busLineItems;
  String? busStationId;
  String? busStationName;
  String? cityCode;
  LatLng? latLng;

  BusStation({
    this.adCode,
    this.busLineItems,
    this.busStationId,
    this.busStationName,
    this.cityCode,
    this.latLng,
  });

  BusStation.fromJson(Map<String, dynamic> json) {
    adCode = json['adCode'] as String;
    if (json['busLineItems'] != null) {
      busLineItems = <BusLineItem>[];
      json['busLineItems'].forEach((v) {
        busLineItems!.add(BusLineItem.fromJson(v as Map<String, dynamic>));
      });
    }
    busStationId = json['busStationId'] as String;
    busStationName = json['busStationName'] as String;
    cityCode = json['cityCode'] as String;
    latLng = json['latLng'] != null ? LatLng.fromJson(json['latLng']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adCode'] = adCode;
    if (busLineItems != null) {
      data['busLineItems'] = busLineItems!.map((v) => v.toJson()).toList();
    }
    data['busStationId'] = busStationId;
    data['busStationName'] = busStationName;
    data['cityCode'] = cityCode;
    if (latLng != null) {
      data['latLng'] = latLng!.toJson();
    }
    return data;
  }

  BusStation copyWith({
    String? adCode,
    List<BusLineItem>? busLineItems,
    String? busStationId,
    String? busStationName,
    String? cityCode,
    LatLng? latLng,
  }) {
    return BusStation(
      adCode: adCode ?? this.adCode,
      busLineItems: busLineItems ?? this.busLineItems,
      busStationId: busStationId ?? this.busStationId,
      busStationName: busStationName ?? this.busStationName,
      cityCode: cityCode ?? this.cityCode,
      latLng: latLng ?? this.latLng,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusStation &&
          runtimeType == other.runtimeType &&
          adCode == other.adCode &&
          busLineItems == other.busLineItems &&
          busStationId == other.busStationId &&
          busStationName == other.busStationName &&
          cityCode == other.cityCode &&
          latLng == other.latLng;

  @override
  int get hashCode =>
      adCode.hashCode ^
      busLineItems.hashCode ^
      busStationId.hashCode ^
      busStationName.hashCode ^
      cityCode.hashCode ^
      latLng.hashCode;

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class BusLineItem {
  double? basicPrice;
  List<LatLng>? bounds;
  String? busLineId;
  String? busLineName;
  String? busLineType;
  List<BusStation>? busStations;
  String? cityCode;
  double? distance;
  String? originatingStation;
  String? terminalStation;
  double? totalPrice;

  BusLineItem({
    this.basicPrice,
    this.bounds,
    this.busLineId,
    this.busLineName,
    this.busLineType,
    this.busStations,
    this.cityCode,
    this.distance,
    this.originatingStation,
    this.terminalStation,
    this.totalPrice,
  });

  BusLineItem.fromJson(Map<String, dynamic> json) {
    basicPrice = json['basicPrice'] as double;
    if (json['bounds'] != null) {
      bounds = <LatLng>[];
      json['bounds'].forEach((v) {
        bounds!.add(LatLng.fromJson(v as Map<String, dynamic>));
      });
    }
    busLineId = json['busLineId'] as String;
    busLineName = json['busLineName'] as String;
    busLineType = json['busLineType'] as String;
    if (json['busStations'] != null) {
      busStations = <BusStation>[];
      json['busStations'].forEach((v) {
        busStations!.add(BusStation.fromJson(v as Map<String, dynamic>));
      });
    }
    cityCode = json['cityCode'] as String;
    distance = json['distance'] as double;
    originatingStation = json['originatingStation'] as String;
    terminalStation = json['terminalStation'] as String;
    totalPrice = json['totalPrice'] as double;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['basicPrice'] = basicPrice;
    if (bounds != null) {
      data['bounds'] = bounds!.map((v) => v.toJson()).toList();
    }
    data['busLineId'] = busLineId;
    data['busLineName'] = busLineName;
    data['busLineType'] = busLineType;
    if (busStations != null) {
      data['busStations'] = busStations!.map((v) => v.toJson()).toList();
    }
    data['cityCode'] = cityCode;
    data['distance'] = distance;
    data['originatingStation'] = originatingStation;
    data['terminalStation'] = terminalStation;
    data['totalPrice'] = totalPrice;
    return data;
  }

  BusLineItem copyWith({
    double? basicPrice,
    List<LatLng>? bounds,
    String? busLineId,
    String? busLineName,
    String? busLineType,
    List<BusStation>? busStations,
    String? cityCode,
    double? distance,
    String? originatingStation,
    String? terminalStation,
    double? totalPrice,
  }) {
    return BusLineItem(
      basicPrice: basicPrice ?? this.basicPrice,
      bounds: bounds ?? this.bounds,
      busLineId: busLineId ?? this.busLineId,
      busLineName: busLineName ?? this.busLineName,
      busLineType: busLineType ?? this.busLineType,
      busStations: busStations ?? this.busStations,
      cityCode: cityCode ?? this.cityCode,
      distance: distance ?? this.distance,
      originatingStation: originatingStation ?? this.originatingStation,
      terminalStation: terminalStation ?? this.terminalStation,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusLineItem &&
          runtimeType == other.runtimeType &&
          basicPrice == other.basicPrice &&
          bounds == other.bounds &&
          busLineId == other.busLineId &&
          busLineName == other.busLineName &&
          busLineType == other.busLineType &&
          busStations == other.busStations &&
          cityCode == other.cityCode &&
          distance == other.distance &&
          originatingStation == other.originatingStation &&
          terminalStation == other.terminalStation &&
          totalPrice == other.totalPrice;

  @override
  int get hashCode =>
      basicPrice.hashCode ^
      bounds.hashCode ^
      busLineId.hashCode ^
      busLineName.hashCode ^
      busLineType.hashCode ^
      busStations.hashCode ^
      cityCode.hashCode ^
      distance.hashCode ^
      originatingStation.hashCode ^
      terminalStation.hashCode ^
      totalPrice.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class Query {
  String? city;
  int? pageNumber;
  int? pageSize;
  String? queryString;

  Query({
    this.city,
    this.pageNumber,
    this.pageSize,
    this.queryString,
  });

  Query.fromJson(Map<String, dynamic> json) {
    city = json['city'] as String;
    pageNumber = json['pageNumber'] as int;
    pageSize = json['pageSize'] as int;
    queryString = json['queryString'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city'] = city;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['queryString'] = queryString;
    return data;
  }

  Query copyWith({
    String? city,
    int? pageNumber,
    int? pageSize,
    String? queryString,
  }) {
    return Query(
      city: city ?? this.city,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      queryString: queryString ?? this.queryString,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Query &&
          runtimeType == other.runtimeType &&
          city == other.city &&
          pageNumber == other.pageNumber &&
          pageSize == other.pageSize &&
          queryString == other.queryString;

  @override
  int get hashCode => city.hashCode ^ pageNumber.hashCode ^ pageSize.hashCode ^ queryString.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}
