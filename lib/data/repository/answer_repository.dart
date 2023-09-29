import 'package:share_study_app/data/domain/answer.dart';

abstract interface class AnswerRepository {
  Future<List<Answer>> getAnswers();
  Future<void> addAnswer(String questionId, String content);
  Future<List<Answer>> getAnswersByQuestionIdWithPagination(
      String questionId, int start, int end);
  Future<List<Answer>> getAnswersByProfileIdWithPagination(
      String profileId, int start, int end);
}
