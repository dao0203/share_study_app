//
//   必要なパッケージのインストールとして下記を実行
//   flutter pub run build_runner build --delete-conflicting-outputs
//   参考：https://pub.dev/packages/freezed
//   flutter pub add freezed_annotation
//   flutter pub add --dev build_runner
//   flutter pub add --dev freezed
//   flutter pub add json_annotation
//   flutter pub add --dev json_serializable
//   参考：https://github.com/rrousselGit/freezed
//
// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/profile.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'answer.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String id,
    required String questionId,
    required String content,
    String? imageUrl,
    String? questionerId,
    String? questionerImageUrl,
    String? questionTitle,
    required bool isBestAnswer,
    required Profile answerer,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Answer;
}
