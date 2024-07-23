import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/util/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppScreen extends HookConsumerWidget {
  const AboutAppScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        title: const Text('シェアスタについて'),
      ),
      body: Markdown(
        imageBuilder: (uri, title, alt) {
          //これをしないと、画像が表示されない
          if (Platform.isAndroid) {
            // Androidのとき
            return Assets.images.aboutSharesta.image(
              fit: BoxFit.cover,
            );
          } else if (Platform.isIOS) {
            // iOSのとき
            return Assets.images.aboutSharestaIos.image(
              fit: BoxFit.cover,
            );
          } else {
            // その他
            return Assets.images.aboutSharesta.image(
              fit: BoxFit.cover,
            );
          }
        },
        onTapLink: (text, href, title) {
          final url = Uri.parse(href!);
          launchUrl(url);
        },
        data: '''
# **よりスマートでスピーディーなスタディライフを**

![image info](assets/images/about_sharesta)

シェアスタは、岩手県立大学の学習支援コーナーというコミュニティ中で活動していく中で感じた課題をヒントに、
より早く、賢く学習を進めるためのアプリです。勉強効率を上げたい、より質の高い学習をしたいという方におすすめです。

## **あなたの質問を迅速にお答え**
実現したいこと、タグ、本文を入力するだけで、あなたの質問を投稿することができます。
また、質問はすべてのユーザに公開されるため、あなたの質問に対して、他のユーザからも回答を得ることができます。

## **迅速な検索で、瞬時に解決**
あなたの悩みを解決するために、シェアスタには検索機能が搭載されています。
検索機能を使うことで、あなたの悩みを解決するためのヒントを得ることができるかもしれません。

## **質問の動向を素早くお届け**
あなたの質問に対する回答があった場合、通知を受け取ることができます。
また、質問に対する回答がベストアンサーに選ばれた場合、通知を受け取ることができます。


## **あなたの回答で誰かの悩みを解決**
あなたの知識や経験を活かして、他のユーザの質問に回答しましょう。
あなたの回答が、他のユーザの悩みを解決することにつながります。
また、回答がベストアンサーを選ばれると、プロフィールにベストアンサー数が表示され、
知識や経験をアピールすることができます。

## **信頼できるユーザをフォロー**
あなたが信頼できるユーザをフォローすることで、そのユーザの質問や回答を優先的に見ることができます。
また、あなたのフォロワーが増えるほど、あなたの回答の影響力が高まります。

# **開発者**
以下の開発者が、シェアスタの開発に携わっています。

- [佐藤 佑哉](https://github.com/dao0203)
- [村木 春友](https://github.com/Mgtantheta)

''',
      ),
    );
  }
}
