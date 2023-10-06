import 'package:flutter/material.dart';

class SuccessSnackBar extends StatelessWidget {
  const SuccessSnackBar({super.key});

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
              Icons.check,
              color: Colors.green,
            ),
            Text(
              '質問が投稿できました！',
              style: TextStyle(color: Colors.green),
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
      closeIconColor: Colors.green,
      clipBehavior: Clip.hardEdge,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
