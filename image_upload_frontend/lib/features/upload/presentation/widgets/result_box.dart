import 'package:flutter/material.dart';
import '../../../../core/constants.dart';

class ResultBox extends StatelessWidget {
  final String source;
  final String result;

  const ResultBox({super.key, required this.source, required this.result});

  @override
  Widget build(BuildContext context) {
    final isSuccess = result.startsWith(AppConstants.statusSuccess);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            isSuccess
                ? AppConstants.successColor.withOpacity(0.1)
                : AppConstants.errorColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(
          color:
              isSuccess ? AppConstants.successColor : AppConstants.errorColor,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.error,
            color:
                isSuccess ? AppConstants.successColor : AppConstants.errorColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  source,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isSuccess
                      ? AppConstants.statusSuccess
                      : AppConstants.statusFailed,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        isSuccess
                            ? AppConstants.successColor
                            : AppConstants.errorColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
