import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateReportController extends GetxController {
  final Rx<CameraController?> _cameraController = Rx<CameraController?>(null);

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    final cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    await cameraController.initialize();
    _cameraController.value = cameraController;
  }

  get cameraController => _cameraController.value;

  @override
  void onInit() async {
    super.onInit();
    await Permission.camera.request();
    if (await Permission.camera.isDenied) Get.back();
    await _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.value?.dispose();
    super.dispose();
  }
}
