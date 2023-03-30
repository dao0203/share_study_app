import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../answer_view_page.dart';

Widget questionListItem(BuildContext context, int index,
    MapEntry<String, Map<String, dynamic>> questionItem) {
  return AnimationConfiguration.staggeredList(
    position: index,
    child: SlideAnimation(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SlideAnimation(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnswerView(
                      questionId: questionItem.key,
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 200,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //質問タイトル
                      Text(
                        "${questionItem.value["title"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),

                      //科目名
                      Text(
                        "${questionItem.value["subjectName"]}",
                        style: const TextStyle(
                          fontSize: 19.0,
                        ),
                      ),

                      //質問内容
                      Text(
                        "${questionItem.value["textContent"]}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
