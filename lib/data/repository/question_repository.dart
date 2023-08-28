import 'package:share_study_app/data/domain/question.dart';

abstract interface class QuestionRepository {
  Future<List<Question>> getQuestions();
  Future<Question> getQuestion(String id);
  Future<void> addQuestion(Question question);
}
