import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../constants.dart';

Widget questionItemsOfAnswerListPage(
    BuildContext context, Map<String, dynamic> questionItems) {
  return InputDecorator(
    decoration: InputDecoration(
      border: InputBorder.none,
      labelText: questionItems[QUESTIONS_LAST_NAME] +
          questionItems[QUESTIONS_FIRST_NAME],
      labelStyle: const TextStyle(
        fontSize: 25,
      ),
    ),
    child: SizedBox(
      height: 400,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //科目名
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  questionItems[QUESTIONS_SUBJECT_NAME],
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),

            //タイトル
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: "タイトル",
                  border: InputBorder.none,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  width: double.infinity,
                  height: 32.0 * 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${questionItems[QUESTIONS_TITLE]}",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ),

            //質問内容
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "質問内容",
                    border: InputBorder.none,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${questionItems[QUESTIONS_QUESTION_CONTENT]}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
