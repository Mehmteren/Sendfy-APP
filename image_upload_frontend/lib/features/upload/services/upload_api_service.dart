import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants.dart';

class UploadApiService {
  Future<String> uploadImage(XFile xfile) async {
    try {
      final uri = Uri.parse(AppConstants.apiUploadUrl);
      final request = http.MultipartRequest('POST', uri);

      if (kIsWeb) {
        final bytes = await xfile.readAsBytes();
        final multipartFile = http.MultipartFile.fromBytes(
          AppConstants.apiUploadField,
          bytes,
          filename: xfile.name,
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(multipartFile);
      } else {
        final file = File(xfile.path);
        request.files.add(
          await http.MultipartFile.fromPath(
            AppConstants.apiUploadField,
            file.path,
            filename: basename(file.path),
          ),
        );
      }

      final response = await request.send();
      if (response.statusCode == 200) {
        return AppConstants.statusSuccess;
      } else {
        return "${AppConstants.statusFailed} (${response.statusCode})";
      }
    } catch (e) {
      return "${AppConstants.statusFailed} (Bağlantı hatası: $e)";
    }
  }
}
