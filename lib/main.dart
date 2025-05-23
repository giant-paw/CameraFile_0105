import 'package:flutter/material.dart';
import 'package:materi_camera/camera_page.dart';
import 'package:materi_camera/home_page_nonBloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePageNonbloc()
    );
  }
}
