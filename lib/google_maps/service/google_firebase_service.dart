// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:io';

import 'package:flight/core/base/base_service.dart';
import 'package:flight/google_maps/model/flight_map_model.dart';
import 'package:flight/google_maps/service/IGoogleFirebaseService.dart';
import 'package:http/http.dart' as http;

class GoogleFirebaseService extends BaseService
    implements IGoogleFirebaseService {
  @override
  Future initMapItemList() async {
    final Uri uri = Uri.parse(mapsPath);
    final response = await http.get(uri);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          var data = jsonData
              .map((e) => FlightMap.fromJson(e))
              .cast<FlightMap>()
              .toList();
          return data;
        } else if (jsonData is Map<String, dynamic>) {
          return FlightMap.fromJson(jsonData);
        } else
          return jsonData;
    }
  }
}
