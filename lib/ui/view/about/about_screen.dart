import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutScreen extends HookConsumerWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        scrolledUnderElevation: 0,
        title: const Text('シェアスタについて'),
      ),
      body: Markdown(
        imageBuilder: (uri, title, alt) {
          //これをしないと、画像が表示されない
          return Image.asset(
            uri.path,
            fit: BoxFit.cover,
          );
        },
        data: '''
# **よりスマートでスピーディーなスタディライフを**

![image info](assets/images/about_sharesta.png)

## **シェアスタとは？**

''',
      ),
    );
  }
}
