import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPostFAB extends HookConsumerWidget {
  const QuestionPostFAB({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      label: Text(label),
      icon: const Icon(Icons.add),
      onPressed: onPressed,
    );
  }
}
