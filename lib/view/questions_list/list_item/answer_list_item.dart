import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../constants.dart';

Widget answerListItem(BuildContext context, int index,
    MapEntry<String, Map<String, dynamic>> answerListItems) {
  return AnimationConfiguration.staggeredList(
    position: index,
    child: SlideAnimation(
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${answerListItems.value[ANSWERS_TEXT]}"),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
