import 'package:flutter/material.dart';

import 'screens/generate_code_screen.dart';
import 'screens/scan_code_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/generate": (context) => const GenerateCodeScreen(),
        "/scan": (context) => const ScanCodeScreen(),
      },
      initialRoute: "/generate",
    );
  }
}
