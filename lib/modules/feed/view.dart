import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/feed/controller.dart';
import 'package:smart_urban_planner/widgets/feed/report_card.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});

  final _controller = Get.find<FeedController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        backgroundColor: Styles.secondaryBackgroundColor,
      ),
      body: SafeArea(
        child: Obx(
          () => _controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () async {
                    await _controller.refetchReports();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                      itemCount: _controller.reports.length,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) {
                        return ReportCard(report: _controller.reports[index]);
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
