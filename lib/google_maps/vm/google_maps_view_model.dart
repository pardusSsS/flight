// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flight/google_maps/model/flight_map_model.dart';
import 'package:flight/google_maps/service/google_firebase_service.dart';
import 'package:flight/google_maps/view/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class GoogleMapsViewModel extends State<GoogleMaps> {
  final GoogleFirebaseService _googleFirebaseService = GoogleFirebaseService();
  BitmapDescriptor? locationIcon;
  GoogleMapController? controller;
  List<FlightMap> flightList = [];

  void navigateToRoot({required int index}) {
    controller
        ?.animateCamera(CameraUpdate.newLatLng(flightList[index].latlong));
  }

  double pageWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double pageHeight(BuildContext context) => MediaQuery.of(context).size.height;

  Future<void> initMapItemList() async {
    final response = await _googleFirebaseService.initMapItemList();
    if (response is List<FlightMap>) {
      controller?.animateCamera(CameraUpdate.newLatLng(response.first.latlong));
      setState(() {
        flightList = response;
      });
    }
  }
}
