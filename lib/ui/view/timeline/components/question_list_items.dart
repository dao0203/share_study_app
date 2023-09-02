import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:share_study_app/data/domain/question.dart';

import '../answer_view_page.dart';

Widget QuestionItem(BuildContext context, int index, Question questionItem) {
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
                      questionId: questionItem.id,
                    ),
                  ),
                );
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "質問",
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
                              questionItem.subjectName,
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              width: double.infinity,
                              height: 32.0 * 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  questionItem.title,
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
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    questionItem.content,
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
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
