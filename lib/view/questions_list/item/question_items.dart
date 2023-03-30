import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../constants.dart';

Widget questionItems(BuildContext context, Map<String, dynamic> questionItems) {
  return SizedBox(
    width: MediaQuery.of(context).size.height * 0.8,
    child: AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: 0,
        child: SlideAnimation(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //質問タイトル
                  Text(
                    questionItems[QUESTIONS_TITLE],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  //科目名
                  Text(
                    questionItems[QUESTIONS_SUBJECT_NAME],
                    style: const TextStyle(fontSize: 19.0),
                  ),
                  // 質問内容
                  Text(
                    questionItems[QUESTIONS_QUESTION_CONTENT],
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


