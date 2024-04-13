import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/create_report/controller.dart';
import 'package:smart_urban_planner/widgets/form_input.dart';

class CreateReportView extends StatelessWidget {
  CreateReportView({super.key});

  final _controller = Get.find<CreateReportController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Report'),
        backgroundColor: Styles.secondaryBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(_controller.image, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                FormInput(
                  controller: _controller.titleController,
                  hintText: 'Enter title report here',
                  isPassword: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                FormInput(
                  controller: _controller.addressController,
                  hintText: 'Enter adress report here',
                  isPassword: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                FormInput(
                  controller: _controller.descriptionController,
                  hintText: 'Enter description report here',
                  maxLines: 5,
                  isPassword: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _controller.submit,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 48)),
                    backgroundColor:
                        MaterialStateProperty.all(Styles.primaryColor),
                  ),
                  child: Obx(
                    () => _controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: Styles.secondaryBackgroundColor,
                          )
                        : const Text('Create Report'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
