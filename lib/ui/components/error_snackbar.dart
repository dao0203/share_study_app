import 'package:flutter/material.dart';

class ErrorSnackBar extends StatelessWidget {
  const ErrorSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SnackBar(
      backgroundColor: Colors.red,
      content: Text('エラーが発生しました'),
    );
  }
}
