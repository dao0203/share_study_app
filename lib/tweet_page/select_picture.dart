/*写真をアップロードする際に使用。最初の実装には使わないファイル */
/**
 * 必要なパッケージのインストールとして下記を実行
 * flutter pub add firebase_core    URL:https://pub.dev/packages/firebase_core/install
 * flutter pub add firebase_auth    URL:https://pub.dev/packages/firebase_auth/install
 * flutter pub add firebase_storage URL:https://pub.dev/packages/firebase_storage/install
 * flutter pub add path_provider    URL:https://pub.dev/packages/path_provider/install
 * 参考：https://qiita.com/kazutxt/items/de764db4c9ffb2ee935a
 */

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

Future<XFile?> select_picture(BuildContext context) async {
  const String SELECT_ICON = "写真をアップロード";
  const List<String> SELECT_ICON_OPTIONS = ["写真から選択", "写真を撮影"];
  const int GALLERY = 0;
  const int CAMERA = 1;

  var _select_type = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(SELECT_ICON),
          children: SELECT_ICON_OPTIONS.asMap().entries.map((e) {
            return SimpleDialogOption(
              child: ListTile(
                title: Text(e.value),
              ),
              onPressed: () => Navigator.of(context).pop(e.key),
            );
          }).toList(),
        );
      });

  final picker = ImagePicker();
  var _img_src;

  if (_select_type == null) {
    return null;
  }
  //カメラで撮影
  else if (_select_type == CAMERA) {
    _img_src = ImageSource.camera;
  }
  //ギャラリーから選択
  else if (_select_type == GALLERY) {
    _img_src = ImageSource.gallery;
  }

  final XFile? pickedFile = await picker.pickImage(
    source: _img_src,
    maxWidth: 70,
    maxHeight: 70,
  );

  if (pickedFile == null) {
    return null;
  } else {
    return pickedFile;
  }
}
