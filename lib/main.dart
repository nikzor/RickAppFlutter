import 'package:flutter/material.dart';
import 'package:rick_app/ui/app_theme.dart';
import 'package:rick_app/ui/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomeScreen(),
      theme: appTheme,
    ),
  );
}
