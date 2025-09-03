import 'package:flutter/material.dart';
import 'package:tz/features/spatkanne/spatkanne_screen.dart';

import 'features/main/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: SpatkanneScreen(),
    );
  }
}