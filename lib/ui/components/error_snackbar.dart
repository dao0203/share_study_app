import 'package:flutter/material.dart';

class ErrorSnackBar extends StatelessWidget {
  const ErrorSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      margin: const EdgeInsetsDirectional.all(16),
      content: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            Text(
              '質問の投稿に失敗しました: error',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      elevation: 4.0,
      backgroundColor: Colors.white,
      closeIconColor: Colors.red,
      clipBehavior: Clip.hardEdge,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
