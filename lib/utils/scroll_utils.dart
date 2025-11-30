import 'package:flutter/material.dart';

void scrollToSection(GlobalKey key) {
  Scrollable.ensureVisible(
    key.currentContext!,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
