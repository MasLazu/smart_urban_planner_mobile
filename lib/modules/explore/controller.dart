import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_urban_planner/data/dummy_data.dart';

class ExploreController extends GetxController {
  final Completer<GoogleMapController> googleController = Completer();
  Position? currentPosition;
  final Rx<dynamic> selected = Rx<dynamic>(null);
  late final Set<Marker> markers;

  ExploreController() {
    markers = reports
        .map((e) => Marker(
              markerId: MarkerId(e.id!),
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

  @override
  void onInit() {
    super.onInit();
    Geolocator.requestPermission();
  }

  Future<LatLng> getinitialCameraPosition() async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      printError(info: e.toString());
      currentPosition = null;
    }
    return LatLng(
      currentPosition?.latitude ?? -7.2804494,
      currentPosition?.longitude ?? 112.7947228,
    );
  }
}
