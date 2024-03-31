import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_urban_planner/data/dummy_data.dart';

class ExploreController extends GetxController {
  final Completer<GoogleMapController> googleController = Completer();

  final double latitude = -7.2804494;
  final double longitude = 112.7947228;

  final Rx<dynamic> selected = Rx<dynamic>(null);

  late final Set<Marker> markers;

  ExploreController() {
    markers = reports
        .map((e) => Marker(
              markerId: MarkerId(e.id),
              position: LatLng(e.latitude, e.longitude),
              infoWindow: InfoWindow(title: e.title),
              onTap: () {
                selected.value = e;
              },
              draggable: false,
            ))
        .toSet();
  }

  void onMapCreated(GoogleMapController controller) {
    if (!googleController.isCompleted) {
      googleController.complete(controller);
    }
  }

  LatLng get initialCameraPosition => LatLng(latitude, longitude);
}
