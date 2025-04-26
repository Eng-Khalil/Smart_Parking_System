import 'package:flutter/material.dart';
import '/../../core/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isDark;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(160, 48),
        backgroundColor:
            isDark ? AppConstants.darkPrimary : AppConstants.lightPrimary,
        foregroundColor:
            isDark ? AppConstants.darkBackground : AppConstants.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}
