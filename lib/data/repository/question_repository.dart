import 'package:share_study_app/data/domain/question.dart';

abstract interface class QuestionRepository {
  Future<List<Question>> getAll();
  Future<Question> get(String id);
  Future<void> add(Question question);
  //limit: 取得する件数
  //offset: 取得する開始位置
  Future<List<Question>> getWithPagination(int start, int end);
}
