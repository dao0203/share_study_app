import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InquiryScreen extends HookConsumerWidget {
  const InquiryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お問い合わせ'),
      ),
      body: const Center(
        child: Text('お問い合わせ画面'),
      ),
    );
  }
}
