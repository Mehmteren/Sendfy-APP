import 'package:flutter/material.dart';
import '../../../../core/constants.dart';

class StatusListView extends StatelessWidget {
  final List<Map<String, String>> uploads;

  const StatusListView({super.key, required this.uploads});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: uploads.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = uploads[index];
        final source = item['source'] ?? '';
        final date = item['date'] ?? '';
        final status = item['status'] ?? '';
        final isSuccess = status == AppConstants.statusSuccess;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              leading: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('lib/src/logo.png', fit: BoxFit.contain),
              ),
              title: Text(
                source,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                date,
                style: TextStyle(color: Colors.grey[400], fontSize: 13),
              ),
              trailing: Text(
                status,
                style: TextStyle(
                  color:
                      isSuccess
                          ? AppConstants.successColor
                          : AppConstants.errorColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
