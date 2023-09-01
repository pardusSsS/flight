// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flight/core/view/widgets/card/country_card.dart';
import 'package:flight/core/view/widgets/divider/bottomsheet_top_divider.dart';
import 'package:flight/google_maps/model/flight_map_model.dart';
import 'package:flight/google_maps/vm/google_maps_view_model.dart';
import 'package:flight/google_maps/vm/maps_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends GoogleMapsViewModel {
  final MapsViewModel mapsViewModel = MapsViewModel();

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
        children: <Widget>[googleMap, buildPositionedAppBar(), bottomListView],
      ),
    );
  }

  Positioned buildPositionedAppBar() {
    return Positioned(
        height: pageHeight(context) * 0.1,
        top: pageHeight(context) * 0.03,
        right: 0,
        left: 0,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Observer(
              builder: (context) => Text(
                    mapsViewModel.title ?? "Hola",
                    style: TextStyle(color: Colors.black),
                  )),
        ));
  }

  Positioned get bottomListView => Positioned(
      right: (pageWidth(context) * 0.05),
      left: -(pageWidth(context) * 0.01),
      height: (pageHeight(context) * 0.15),
      bottom: (pageHeight(context) * 0.03),
      child: flightList.isEmpty ? loadingWidget : listViewFlights);

  Widget get loadingWidget => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.red),
        ),
      );

  PageView get listViewFlights => PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        onPageChanged: (index) {
          mapsViewModel.changeAppBarName(text: flightList[index].country);
          navigateToRoot(index: index);
        },
        scrollDirection: Axis.horizontal,
        itemCount: flightList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCountryCard(flightList[index]);
        },
      );

  Widget buildCountryCard(FlightMap item) {
    return CountryCard(
      imageUrl: item.photoUrl,
      title: item.country,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            enableDrag: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) {
              return _bottomSheet(item.detail);
            });
      },
    );
  }

  Widget _bottomSheet(Detail detail) => const Column(
        children: <Widget>[
          BottomsheetTopDivider(
            colors: Colors.grey,
            indent: .40,
          )
        ],
      );

  GoogleMap get googleMap => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            const CameraPosition(target: LatLng(37.0590, 37.3543), zoom: 20),
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
    return flightList
        .map((e) => Marker(
            markerId: MarkerId(e.hashCode.toString()),
            position: e.latlong,
            infoWindow: InfoWindow(title: e.country),
            icon: locationIcon ??
                BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueMagenta)))
        .toSet();
  }
}
