import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool outline;
  final double? width;
  final double? height;

  const Button({
    super.key,
    required this.label,
    required this.onTap,
    this.outline = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final bg = outline ? Colors.transparent : AppColors.primary;
    final fg = outline ? AppColors.foreground : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height ?? 48,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: outline ? Border.all(color: AppColors.border) : null,
          boxShadow: outline
              ? null
              : [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
        child: Center(
          child: Text(label,
              style: TextStyle(color: fg, fontWeight: FontWeight.w600, fontSize: 14)),
        ),
      ),
    );
  }
}
