import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<FileSystemEntity> images = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    final dir = await getApplicationDocumentsDirectory();
    final files =
        Directory(dir.path).listSync().where((f) => f.path.endsWith('.jpg')).toList();
    setState(() => images = files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: images.isEmpty
          ? const Center(child: Text('No photos yet'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
              ),
              itemCount: images.length,
              itemBuilder: (_, i) =>
                  Image.file(File(images[i].path), fit: BoxFit.cover),
            ),
    );
  }
}
