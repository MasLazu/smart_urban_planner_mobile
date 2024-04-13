import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_urban_planner/core/constant.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/detail_report/controller.dart';

class DetailReportView extends StatelessWidget {
  DetailReportView({super.key});

  final Completer<GoogleMapController> googleController = Completer();
  final _controller = Get.find<DetailReportController>();

  void onMapCreated(GoogleMapController controller) {
    if (!googleController.isCompleted) {
      googleController.complete(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Report'),
        backgroundColor: Styles.secondaryBackgroundColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => _controller.isLoading.value
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                '$backendUrl${_controller.report.value!.image}',
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Iconsax.trend_up_bold,
                                  size: 32,
                                  color: Styles.primaryColor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _controller.report.value!.popularity
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Styles.foregroundColor,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(20, 32)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Styles.secondaryColor),
                                ),
                                child: const Text("Subscribe"))
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _controller.report.value!.title,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Styles.foregroundColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _controller.report.value!.address,
                              style: TextStyle(
                                fontSize: 16,
                                color: Styles.foregroundColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${_controller.report.value!.createdAt!.day.toString().padLeft(2, '0')}/${_controller.report.value!.createdAt!.month.toString().padLeft(2, '0')}/${_controller.report.value!.createdAt!.year.toString()}',
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        const Divider(),
                        const SizedBox(height: 14),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GoogleMap(
                              zoomControlsEnabled: false,
                              mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    _controller.report.value!.latitude,
                                    _controller.report.value!.longitude),
                                zoom: 16,
                              ),
                              onMapCreated: onMapCreated,
                              markers: {
                                Marker(
                                  markerId:
                                      MarkerId(_controller.report.value!.id!),
                                  position: LatLng(
                                      _controller.report.value!.latitude,
                                      _controller.report.value!.longitude),
                                  infoWindow: InfoWindow(
                                      title: _controller.report.value!.title),
                                  draggable: false,
                                )
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(_controller.report.value!.description,
                            maxLines: null),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
