import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/create_report/controller.dart';

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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: Theme.of(context).textTheme.titleLarge,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Styles.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Styles.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Styles.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                  maxLines: 6,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: Theme.of(context).textTheme.titleLarge,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Styles.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Styles.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Styles.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.formKey.currentState!.validate()) {
                      Get.snackbar("yole", "yole");
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 48)),
                    backgroundColor:
                        MaterialStateProperty.all(Styles.primaryColor),
                  ),
                  child: const Text('Create Report'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
