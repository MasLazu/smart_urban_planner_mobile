import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/data/models/report.dart';
import 'package:smart_urban_planner/modules/explore/controller.dart';

class ExploreView extends StatelessWidget {
  ExploreView({super.key});

  final _controller = Get.find<ExploreController>();

  Widget _buildMarkerCard() {
    final selected = _controller.selected.value;
    if (selected is Report) {
      return GestureDetector(
        onTap: () {
          Get.toNamed('/report/${selected.id}');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: List.from(
                    [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 106,
                        width: 106,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            selected.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selected.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.warning_2_bold,
                                  color: Styles.warningColor,
                                  size: 22,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Report",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Styles.warningColor,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              selected.address,
                              style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              selected.description,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Styles.mutedForegroundColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final cameraPosition = _controller.getinitialCameraPosition();
    return Stack(
      children: [
        FutureBuilder(
            future: cameraPosition,
            builder: (contenxt, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return GoogleMap(
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: snapshot.data!,
                    zoom: 16,
                  ),
                  onMapCreated: _controller.onMapCreated,
                  markers: _controller.markers,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        Obx(() => _buildMarkerCard()),
      ],
    );
  }
}
