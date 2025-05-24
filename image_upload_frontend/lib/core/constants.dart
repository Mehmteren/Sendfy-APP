import 'package:flutter/material.dart';

class AppConstants {
  static const double defaultPadding = 16.0;
  static const double borderRadius = 20.0;

  static const Color successColor = Colors.green;
  static const Color errorColor = Colors.red;
  static const Color backgroundColor = Color(0xFF121212);

  static const String appTitle = "Sendify";

  static const String apiUploadUrl = "https://localhost:7070/api/Image/upload";

  static const String statusSuccess = "Success";
  static const String statusFailed = "Failed";
  static const String apiUploadField = "file";
}
