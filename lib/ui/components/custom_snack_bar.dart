import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar create({
    required BuildContext context,
    required String text,
    // required Color backgroundColor,
    // required Color textColor,
    Icon? icon,
    ProgressIndicator? progressIndicator,
  }) {
    return SnackBar(
      content: Row(
        children: [
          const SizedBox(width: 24),
          progressIndicator ?? const SizedBox(),
          icon ?? const SizedBox(),
          const SizedBox(width: 24),
          Text(text,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground)),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      showCloseIcon: true,
      elevation: 4.0,
      closeIconColor: Theme.of(context).colorScheme.onBackground,
      clipBehavior: Clip.hardEdge,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  static SnackBar createError({
    required BuildContext context,
    required String text,
    Icon? icon,
  }) {
    return SnackBar(
      content: Row(
        children: [
          icon ?? const SizedBox(),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      showCloseIcon: true,
      elevation: 4.0,
      closeIconColor: Theme.of(context).colorScheme.onBackground,
      clipBehavior: Clip.hardEdge,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
