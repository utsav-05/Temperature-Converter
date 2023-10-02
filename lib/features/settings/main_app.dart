import 'package:flutter/material.dart';
import 'package:flutter_temperatureconverter/features/home/presentation/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      home: HomePage(),
    );
  }
}
