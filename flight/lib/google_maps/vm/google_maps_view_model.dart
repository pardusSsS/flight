// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:io';

import 'package:flight/google_maps/model/flight_map_model.dart';
import 'package:flight/google_maps/view/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

abstract class GoogleMapsViewModel extends State<GoogleMaps> {
  BitmapDescriptor? locationIcon;
  GoogleMapController? controller;
  final firebaseServiceEndPoint =
      "https://flight-74652-default-rtdb.firebaseio.com/map.json";
  List<FlightMap> flightList = [];

  void navigateToRoot({required int index}) {
    controller
        ?.animateCamera(CameraUpdate.newLatLng(flightList[index].latlong));
  }

  double pageWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double pageHeight(BuildContext context) => MediaQuery.of(context).size.height;

  Future<void> initMapItemList() async {
    final Uri uri = Uri.parse(firebaseServiceEndPoint);
    final response = await http.get(uri);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          flightList = jsonData
              .map((e) => FlightMap.fromJson(e))
              .cast<FlightMap>()
              .toList();

          controller
              ?.animateCamera(CameraUpdate.newLatLng(flightList.first.latlong));
          setState(() {});
        } else if (jsonData is Map) {
        } else
          return jsonData;
    }
  }
}
