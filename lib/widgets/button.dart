import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Button extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool outline;
  final double? width;
  final double? height;
  final Color? color;      
  final Color? textColor;   
  final Color? outlineColor; 

  const Button({
    super.key,
    required this.label,
    required this.onTap,
    this.outline = false,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.outlineColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.outline
        ? Colors.transparent
        : widget.color ?? AppColors.primary;
    final fg = widget.textColor ??
        (widget.outline ? (widget.outlineColor ?? AppColors.foreground) : Colors.white);
    final borderColor = widget.outline ? (widget.outlineColor ?? AppColors.border) : null;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.height ?? 48,
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: _hovering
                ? (widget.outline
                    ? (widget.outlineColor ?? AppColors.primary).withValues(alpha:0.1)
                    : (widget.color ?? AppColors.primary).withValues(alpha:0.8))
                : bg,
            borderRadius: BorderRadius.circular(12),
            border: borderColor != null ? Border.all(color: borderColor) : null,
            boxShadow: widget.outline
                ? null
                : [
                    BoxShadow(
                      color: (widget.color ?? AppColors.primary).withValues(alpha:0.12),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: fg,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
