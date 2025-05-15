import 'dart:io';
import 'package:materi_camera/camera_page.dart';
import 'package:materi_camera/storage_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class HomePageNonbloc extends StatefulWidget {
  const HomePageNonbloc({super.key});

  @override
  State<HomePageNonbloc> createState() => _HomePageNonblocState();
}

class _HomePageNonblocState extends State<HomePageNonbloc> {
  File? _imageFile;

  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> _takePicture() async {
    await _requestPermissions();
    final File? result = await Navigator.push<File>(
      context,
      MaterialPageRoute(builder: (_) => const CameraPage()),
    );
    if (result != null) {
      final saved = await StorageHelper.saveImage(result, 'camera');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Disimpan: ${saved.path}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}