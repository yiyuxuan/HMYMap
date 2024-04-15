import 'dart:convert';

import 'package:amap_search/model/models.dart';

class PoiResult {
  /// 返回的POI数目 [Android, iOS]
  int? pageCount;

  /// 搜索边界 [Android]
  SearchBound? bound;

  /// POI结果，AMapPOI 数组 [Android, iOS]
  List<PoiItem>? pois;

  /// 请求参数 [Android]
  Query? query;

  /// 城市建议列表 [Android, iOS]
  List<SuggestionCity>? searchSuggestionCitys;

  /// 关键字建议列表 [Android, iOS]
  List<String>? searchSuggestionKeywords;

  PoiResult({
    this.pageCount,
    this.bound,
    this.pois,
    this.query,
    this.searchSuggestionCitys,
    this.searchSuggestionKeywords,
  });

  PoiResult.fromJson(Map<String, dynamic> json) {
    pageCount = json['pageCount'] as int;
    if (json['bound'] != null) {
      bound = SearchBound.fromJson(json['bound'] as Map<String, Object>);
    }
    if (json['pois'] != null) {
      pois = <PoiItem>[];
      json['pois'].forEach((v) {
        pois!.add(PoiItem.fromJson(v as Map<String, dynamic>));
      });
    }
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
    if (json['searchSuggestionCitys'] != null) {
      searchSuggestionCitys = <SuggestionCity>[];
      json['searchSuggestionCitys'].forEach((v) {
        searchSuggestionCitys!.add(SuggestionCity.fromJson(v as Map<String, dynamic>));
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
    data['pageCount'] = pageCount;
    data['bound'] = bound?.toJson();
    if (pois != null) {
      data['pois'] = pois!.map((v) => v.toJson()).toList();
    }
    if (query != null) {
      data['query'] = query!.toJson();
    }
    if (searchSuggestionCitys != null) {
      data['searchSuggestionCitys'] = searchSuggestionCitys!.map((v) => v.toJson()).toList();
    }
    if (searchSuggestionKeywords != null) {
      data['searchSuggestionKeywords'] = searchSuggestionKeywords;
    }
    return data;
  }

  PoiResult copyWith({
    int? pageCount,
    List<PoiItem>? pois,
    Query? query,
    List<SuggestionCity>? searchSuggestionCitys,
    List<String>? searchSuggestionKeywords,
  }) {
    return PoiResult(
      pageCount: pageCount ?? this.pageCount,
      pois: pois ?? this.pois,
      query: query ?? this.query,
      searchSuggestionCitys: searchSuggestionCitys ?? this.searchSuggestionCitys,
      searchSuggestionKeywords: searchSuggestionKeywords ?? this.searchSuggestionKeywords,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PoiResult &&
          runtimeType == other.runtimeType &&
          pageCount == other.pageCount &&
          pois == other.pois &&
          query == other.query &&
          searchSuggestionCitys == other.searchSuggestionCitys &&
          searchSuggestionKeywords == other.searchSuggestionKeywords;

  @override
  int get hashCode =>
      pageCount.hashCode ^
      pois.hashCode ^
      query.hashCode ^
      searchSuggestionCitys.hashCode ^
      searchSuggestionKeywords.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}
