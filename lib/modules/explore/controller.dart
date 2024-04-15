import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_urban_planner/data/repositories/report_repository.dart';

class ExploreController extends GetxController {
  final Completer<GoogleMapController> googleController = Completer();
  final Rx<Position?> currentPosition = Rx<Position?>(null);
  final Rx<dynamic> selected = Rx<dynamic>(null);
  final RxBool isLoading = true.obs;
  final _reportRepository = Get.find<ReportRepository>();
  final Rx<Set<Marker>> markers = Rx<Set<Marker>>({});

  void onMapCreated(GoogleMapController controller) {
    if (!googleController.isCompleted) {
      googleController.complete(controller);
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    super.onInit();
    await Geolocator.requestPermission();
    await getinitialCameraPosition();
    final reports = await _reportRepository.getAll();
    markers.value = reports
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
    isLoading.value = false;
  }

  Future<void> getinitialCameraPosition() async {
    try {
      currentPosition.value = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentPosition.value = null;
    }
  }
}
