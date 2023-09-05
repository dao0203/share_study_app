import 'package:share_study_app/data/domain/question.dart';

abstract interface class QuestionRepository {
  Future<List<Question>> getAll();
  Future<Question> get(String id);
  Future<void> add(Question question);
  Future<List<Question>> getWithPagination(int start, int end);
  Future<void> bookmark(String id);
  Future<void> unbookmark(String id);
}
