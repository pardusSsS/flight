// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_declarations, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flight/google_maps/model/flight_map_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

main() {
  final firebaseServiceEndPoint =
      "https://flight-74652-default-rtdb.firebaseio.com/map.json";

  test('firebase map test', () async {
    final Uri uri = Uri.parse(firebaseServiceEndPoint);
    final response = await http.get(uri);
    var responseData;

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          responseData = jsonData
              .map((e) => FlightMap.fromJson(e))
              .cast<FlightMap>()
              .toList();
        } else if (jsonData is Map) {
        } else
          return jsonData;
    }
    expect(responseData is List<FlightMap>, true);
  });
}
