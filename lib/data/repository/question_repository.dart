import 'package:share_study_app/data/domain/question.dart';

abstract interface class QuestionRepository {
  Future<List<Question>> getAll();
  Future<Question> get(String id);
  Future<void> add(
      String title, String content, String subjectName, String? path);
  Future<void> delete({required String questionId});
  Future<void> reportQuestion({
    required String questionId,
    required String reason,
    required bool wantToHideQuestion,
  });
  Future<List<Question>> getWithPagination({
    required int offset,
    required int limit,
  });
  Future<void> hide({
    required String questionId,
  });
  Future<List<Question>> getWithPaginationAndKeyword({
    required int offsetAmount,
    required int limitAmount,
    required String keyword,
  });
  Future<List<Question>> getWithPaginationAndProfileId(
      int start, int end, String userId);
  Future<List<Question>> getResolvedWithPaginationAndProfileId(
      String profileId, int start, int end);
  Future<void> bookmark(String id);
  Future<void> unbookmark(String id);
}
