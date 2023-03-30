import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget answerListText() {
  return const AnimationLimiter(
    child: AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        child: Text(
          "回答一覧",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
