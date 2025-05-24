import 'dart:io';
import 'package:flutter/foundation.dart'; // kIsWeb için
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewBox extends StatelessWidget {
  final XFile? selectedImage;

  const ImagePreviewBox({super.key, this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFF00DBDE), Color(0xFF3CA55C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child:
          selectedImage != null
              ? kIsWeb
                  ? Image.network(
                    selectedImage!.path,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                  : Image.file(
                    File(selectedImage!.path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
              : const Center(
                child: Icon(Icons.image, size: 60, color: Colors.white70),
              ),
    );
  }
}
