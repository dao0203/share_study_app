
import 'package:flutter/material.dart';

enum TopLevelDestination{
  
  const TopLevelDestination({
    required this.title,
    required this.icon,
    required this.page,
  });

  final String title;
  final IconData icon;
  final Widget page;

  timeline(
    title: 'タイムライン',
    icon: Icons.home,
    page: const (),
  ),

}