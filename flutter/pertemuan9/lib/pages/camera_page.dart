import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import '../services/camera_service.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  int selectedCamera = 0;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    await CameraService.init();
    controller = CameraController(
      CameraService.cameras[selectedCamera],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await controller!.initialize();
    setState(() {});
  }

  void switchCamera() {
    selectedCamera = selectedCamera == 0 ? 1 : 0;
    initCamera();
  }

  Future<void> takePicture() async {
    if (!controller!.value.isInitialized) return;

    final picture = await controller!.takePicture();
    final directory = await getApplicationDocumentsDirectory();
    final newPath = "${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";
    final file = File(picture.path);
    await file.copy(newPath);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Saved: $newPath")),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Camera Preview')),
      body: Stack(
        children: [
          CameraPreview(controller!),
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              heroTag: 'switch',
              onPressed: switchCamera,
              child: const Icon(Icons.switch_camera),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'capture',
              onPressed: takePicture,
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }
}