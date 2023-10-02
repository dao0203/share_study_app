import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/repository/answer_repository.dart';

import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/data/repository/answer_repository.dart';

class UpdateAnswerUseCase {
  final AnswerRepository _answerRepository;

  UpdateAnswerUseCase(this._answerRepository);

  call(String answerId, bool isBestAnswer) async {
    await _answerRepository.updateIsBestAnswer(answerId, isBestAnswer);
  }
  // Future<void> updateIsBestAnswer(String answerId, bool isBestAnswer) async {
  //   // Implement your update logic here using _answerRepository
  //   await _answerRepository.updateIsBestAnswer(answerId, isBestAnswer);
  // }
}
