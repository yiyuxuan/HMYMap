class PoiExtension {
  /// 营业时间 [Android, iOS]
  String? opentime;

  /// 评分 [Android, iOS]
  String? rating;

  /// 人均消费 [iOS]
  num? cost;

  PoiExtension({
    this.opentime,
    this.rating,
    this.cost,
  });

  PoiExtension.fromJson(Map<String, dynamic> json) {
    if (json['opentime'] != null) {
      opentime = json['opentime'] as String;
    }

    if (json['rating'] != null) {
      rating = json['rating'] as String;
    }

    if (json['cost'] != null) {
      cost = json['cost'] as num;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['opentime'] = opentime;
    data['rating'] = rating;
    data['cost'] = cost;
    return data;
  }

  PoiExtension copyWith({
    String? opentime,
    String? rating,
    double? cost,
  }) {
    return PoiExtension(
      opentime: opentime ?? this.opentime,
      rating: rating ?? this.rating,
      cost: cost ?? this.cost,
    );
  }

  @override
  String toString() {
    return 'PoiExtension{opentime: $opentime, rating: $rating, cost: $cost}';
  }
}
