import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../constants.dart';

Widget answerListItem(BuildContext context, int index,
    MapEntry<String, Map<String, dynamic>> answerListItems) {
  return AnimationConfiguration.staggeredList(
    position: index,
    child: SlideAnimation(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputDecorator(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: answerListItems.value[ANSWERS_LAST_NAME] +
                answerListItems.value[ANSWERS_FIRST_NAME],
            labelStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
          child: SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.height * 0.8,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${answerListItems.value[ANSWERS_TEXT]}"),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
