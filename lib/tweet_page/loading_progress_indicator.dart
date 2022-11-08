import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_study_app/tweet_page/question_post_page.dart';

Widget loadingProgressIndicator() {
  return Scaffold(
    appBar: AppBar(
      title: const Text("投稿中です･･･"),
      automaticallyImplyLeading: false,
    ),
    body: Center(
      child: Center(
        child: CircularProgressIndicator(), //真ん中に表示
      ),
    ),
  );
//質問閲覧の所に戻る予定
}
