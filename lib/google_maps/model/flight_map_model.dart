import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_map_model.g.dart';

@JsonSerializable()
class FlightMap {
  late final String country;
  late final Detail detail;
  late final double lat;
  late final double long;
  late final String name;
  late final String photoUrl;
  late final String status;
  late final List<Tags> tags;

  FlightMap({
    required this.country,
    required this.detail,
    required this.lat,
    required this.long,
    required this.name,
    required this.photoUrl,
    required this.status,
    required this.tags,
  });

  factory FlightMap.fromJson(Map<String, dynamic> json) =>
      _$FlightMapFromJson(json);

  // {
  //   country = json['country'];
  //   detail = Detail.fromJson(json['detail']);
  //   lat = json['lat'];
  //   long = json['long'];
  //   name = json['name'];
  //   photoUrl = json['photoUrl'];
  //   status = json['status'];
  //   tags = List.from(json['tags']).map((e) => Tags.fromJson(e)).toList();
  // }

  Map<String, dynamic> toJson() => _$FlightMapToJson(this);
  // {
  //   final _data = <String, dynamic>{};
  //   _data['country'] = country;
  //   _data['detail'] = detail.toJson();
  //   _data['lat'] = lat;
  //   _data['long'] = long;
  //   _data['name'] = name;
  //   _data['photoUrl'] = photoUrl;
  //   _data['status'] = status;
  //   _data['tags'] = tags.map((e) => e.toJson()).toList();
  //   return _data;
  // }
}

@JsonSerializable()
class Detail {
  Detail({
    required this.description,
  });
  late final String description;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  // {
  //   description = json['description'];
  // }

  Map<String, dynamic> toJson() => _$DetailToJson(this);
  // {
  //   final _data = <String, dynamic>{};
  //   _data['description'] = description;
  //   return _data;
  // }
}

@JsonSerializable()
class Tags {
  Tags({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  // {
  //   id = json['id'];
  //   name = json['name'];
  // }

  Map<String, dynamic> toJson() => _$TagsToJson(this);
  // {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['name'] = name;
  //   return _data;
  // }
}

extension FlightlatLong on FlightMap {
  LatLng get latlong => LatLng(lat, long);
}
