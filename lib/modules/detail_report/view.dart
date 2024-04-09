import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/data/dummy_data.dart';

class DetailReportView extends StatelessWidget {
  DetailReportView({super.key});

  final report = reports.firstWhere((e) => e.id == Get.parameters['id']);

  final Completer<GoogleMapController> googleController = Completer();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(report.image, fit: BoxFit.cover),
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
                        report.popularity.toString(),
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
                        minimumSize:
                            MaterialStateProperty.all(const Size(20, 32)),
                        backgroundColor:
                            MaterialStateProperty.all(Styles.secondaryColor),
                      ),
                      child: const Text("Subscribe"))
                ],
              ),
              const SizedBox(height: 4),
              Text(
                report.title,
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
                    report.location,
                    style: TextStyle(
                      fontSize: 16,
                      color: Styles.foregroundColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${report.createdAt.day.toString().padLeft(2, '0')}/${report.createdAt.month.toString().padLeft(2, '0')}/${report.createdAt.year.toString()}',
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
                      target: LatLng(report.latitude, report.longitude),
                      zoom: 16,
                    ),
                    onMapCreated: onMapCreated,
                    markers: {
                      Marker(
                        markerId: MarkerId(report.id),
                        position: LatLng(report.latitude, report.longitude),
                        infoWindow: InfoWindow(title: report.title),
                        draggable: false,
                      )
                    },
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(report.description, maxLines: null),
            ],
          ),
        ),
      ),
    );
  }
}
