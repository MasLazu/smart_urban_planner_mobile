import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_urban_planner/core/constant.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/data/models/report.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/report/${report.id}'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Styles.secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                report.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      report.address,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    '${report.createdAt!.day.toString().padLeft(2, '0')}/${report.createdAt!.month.toString().padLeft(2, '0')}/${report.createdAt!.year.toString()}',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '$backendUrl${report.image}',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.warning_2_bold,
                        size: 32,
                        color: Styles.warningColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Report",
                        style: TextStyle(
                            color: Styles.warningColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Styles.backgroundColor,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.arrow_circle_up_bold,
                          size: 28,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          report.popularity.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Iconsax.arrow_circle_down_bold,
                          size: 28,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Text(
                report.description,
                maxLines: 3,
                style: TextStyle(
                  color: Styles.mutedForegroundColor,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
