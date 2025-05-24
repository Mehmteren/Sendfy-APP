import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../upload/services/image_picker_service.dart';

class ActionButtons extends StatelessWidget {
  final void Function(XFile image, String source) onResult;

  const ActionButtons({super.key, required this.onResult});

  Future<void> _handlePick(
    BuildContext context,
    String sourceLabel,
    Future<XFile?> Function() pickFunction,
  ) async {
    final image = await pickFunction();
    if (image != null) {
      onResult(image, sourceLabel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap:
                  () => _handlePick(
                    context,
                    "Gallery",
                    ImagePickerService().pickFromGallery,
                  ),
              child: const _StyledGradientButton(
                label: 'Select from Gallery',
                icon: Icons.image,
                gradientColors: [Color(0xFF00DBDE), Color(0xFF8BC34A)],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap:
                  () => _handlePick(
                    context,
                    "Camera",
                    ImagePickerService().pickFromCamera,
                  ),
              child: const _StyledGradientButton(
                label: 'Shoot with Camera',
                icon: Icons.photo_camera,
                gradientColors: [Color(0xFF00DBDE), Color(0xFF8BC34A)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StyledGradientButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<Color> gradientColors;

  const _StyledGradientButton({
    required this.label,
    required this.icon,
    required this.gradientColors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
