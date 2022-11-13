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
              //今はネットからだが、アップロードした写真を表示する予定
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
