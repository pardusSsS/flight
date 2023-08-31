// ignore_for_file: invalid_use_of_protected_member

import 'package:flight/google_maps/google_maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends GoogleMapsViewModel {
  @override
  void initState() {
    super.initState();
    locationIcon = BitmapDescriptor.defaultMarker;
    controller = null;
    Future.microtask(() => initMapItemList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      body: Stack(
        children: <Widget>[googleMap, bottomListView],
      ),
    );
  }

  Positioned get bottomListView => Positioned(
      right: 20,
      left: 20,
      height: 100,
      bottom: 20,
      child: flightList.isEmpty ? loadingWidget : listViewFlights);

  Widget get loadingWidget => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.red),
        ),
      );

  ListView get listViewFlights => ListView.builder(
        itemCount: flightList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(flightList[index].country),
          );
        },
      );

  GoogleMap get googleMap => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            const CameraPosition(target: LatLng(37.0590, 37.3543)),
        onMapCreated: (map) async {
          controller = map;
          await _createMarkerImageFromAsset(context);
        },
        markers: _createMarker(),
      );

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        controller?.animateCamera(CameraUpdate.zoomTo(15));
      },
      child: const Icon(Icons.zoom_in),
    );
  }
}

extension _GoogleMapsMarker on GoogleMapsView {
  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (locationIcon == BitmapDescriptor.defaultMarker) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      var bitmap = await BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'assets/images/location.png');
      setState(() {
        locationIcon = bitmap;
      });
    }
  }

  Set<Marker> _createMarker() {
    return <Marker>{
      Marker(
          markerId: const MarkerId("1"),
          position: const LatLng(37.0590, 37.3543),
          infoWindow: const InfoWindow(title: "Hola"),
          icon: locationIcon ??
              BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueMagenta))
    };
  }
}
