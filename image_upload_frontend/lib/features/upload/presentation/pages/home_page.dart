// ✅ lib/features/upload/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../widgets/image_preview.dart';
import '../widgets/action_buttons.dart';
import '../widgets/upload_button.dart';
import '../widgets/status_list.dart';
import '../../../../shared/bottom_nav.dart';
import '../../../../core/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uploadResult = "";
  String uploadSource = "";
  XFile? selectedImage;
  final List<Map<String, String>> uploads = [];

  void updateSelectedImage(XFile image, String source) {
    setState(() {
      selectedImage = image;
      uploadSource = source;
      uploadResult = "";
    });
  }

  void updateResult(String result) {
    setState(() {
      uploadResult = result;
      if (uploadSource.isNotEmpty) {
        uploads.insert(0, {
          'source': uploadSource,
          'date': DateFormat('MMMM d, yyyy').format(DateTime.now()),
          'status':
              result.startsWith(AppConstants.statusSuccess)
                  ? AppConstants.statusSuccess
                  : AppConstants.statusFailed,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'lib/src/logo.png',
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sendify',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '♛ Picture Sending Robot',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            ImagePreviewBox(selectedImage: selectedImage),
            const SizedBox(height: 16),
            ActionButtons(onResult: updateSelectedImage),
            UploadButton(
              image: selectedImage,
              source: uploadSource,
              onResult: updateResult,
            ),
            const SizedBox(height: 12),
            Expanded(child: StatusListView(uploads: uploads)),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
