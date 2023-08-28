import 'package:share_study_app/data/domain/answer.dart';

abstract interface class AnswerRepository {
  Future<List<Answer>> getAnswers();
  Future<void> addAnswer(Answer answer);
}
