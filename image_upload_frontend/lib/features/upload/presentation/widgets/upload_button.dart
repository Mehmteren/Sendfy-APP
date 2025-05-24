import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../upload/services/upload_api_service.dart';
import '../../../../core/constants.dart';

class UploadButton extends StatelessWidget {
  final XFile? image;
  final String source;
  final void Function(String result) onResult;

  const UploadButton({
    super.key,
    required this.image,
    required this.source,
    required this.onResult,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = image == null;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: InkWell(
          onTap:
              isDisabled
                  ? null
                  : () async {
                    try {
                      final result = await UploadApiService().uploadImage(
                        image!,
                      );
                      onResult(result);
                    } catch (e) {
                      onResult("${AppConstants.statusFailed} (Hata: $e)");
                    }
                  },
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00DBDE), Color(0xFF3CA55C)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.upload_rounded, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Upload Image",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
