import 'package:camera/camera.dart';

class CameraService {
  static List<CameraDescription> cameras = [];

  static Future<void> init() async {
    cameras = await availableCameras();
  }
}
