import 'package:flutter/material.dart';

enum AppEnvironmentBanner {
  development(name: 'DEV', color: Colors.blue),
  staging(name: 'STG', color: Colors.yellow)
  ;

  const AppEnvironmentBanner({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}
