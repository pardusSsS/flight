class FlightMap {
  FlightMap({
    required this.country,
    required this.lat,
    required this.long,
  });
  late final String country;
  late final double lat;
  late final double long;

  FlightMap.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['lat'] = lat;
    _data['long'] = long;
    return _data;
  }
}
