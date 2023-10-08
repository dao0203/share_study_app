import 'package:share_study_app/data/domain/question.dart';

abstract interface class QuestionRepository {
  Future<List<Question>> getAll();
  Future<Question> get(String id);
  Future<void> add(
      String title, String content, String subjectName, String? path);
  Future<List<Question>> getWithPagination(int start, int end);
  Future<List<Question>> getWithPaginationAndKeyword(
      int start, int end, String keyword);
  Future<List<Question>> getWithPaginationAndProfileId(
      int start, int end, String userId);
  Future<List<Question>> getResolvedWithPaginationAndProfileId(
      String profileId, int start, int end);
  Future<void> bookmark(String id);
  Future<void> unbookmark(String id);
}
