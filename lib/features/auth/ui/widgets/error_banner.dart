import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:flutter/material.dart';

class ErrorBanner extends StatelessWidget {
  final String? message;
  
  ErrorBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null || message!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorsManager.red, width: 1.2),
          color: ColorsManager.red.withOpacity(0.08),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: ColorsManager.red, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message!,
                style: TextStyle(
                  color: ColorsManager.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}