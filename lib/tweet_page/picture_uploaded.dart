import 'package:flutter/material.dart';
import 'question_post_page.dart';
import 'package:image_picker/image_picker.dart';

Widget PictureUploaded() {
  return Column(
    children: [
      SizedBox(
        height: 90,
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              '',
              errorBuilder: (c, o, s) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                );
              },
            ),
          ),
        ),
      )
    ],
  );
}
