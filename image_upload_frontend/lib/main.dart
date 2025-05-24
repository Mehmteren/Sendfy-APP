import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/upload/presentation/pages/home_page.dart';

void main() {
  runApp(const SendifyApp());
}

class SendifyApp extends StatelessWidget {
  const SendifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sendify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
