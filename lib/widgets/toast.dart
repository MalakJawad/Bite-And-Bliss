import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

void showToast(BuildContext context, {required String title, String? description}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();

  messenger.showSnackBar(
    SnackBar(
      backgroundColor: AppColors.card,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      elevation: 8,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.foreground)),
          if (description != null) const SizedBox(height: 6),
          if (description != null) Text(description, style: const TextStyle(color: AppColors.muted)),
        ],
      ),
      duration: const Duration(seconds: 3),
      animation: CurvedAnimation(parent: AnimationController(vsync: Scaffold.of(context), duration: const Duration(milliseconds: 250)), curve: Curves.easeIn),
    ),
  );
}
