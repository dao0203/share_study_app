import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseQuestionRepository implements QuestionRepository {
  final _client = Supabase.instance.client;
  @override
  Future<void> add(Question question) async {
    await _client.from('questions').insert({
      'title': question.title,
      'subject': question.subjectName,
      'content': question.content,
    }).then((value) {
      Logger().d('addQuestion.then: $value');
    }).catchError((error) {
      Logger().e('addQuestion.error: $error');
    });
  }

  @override
  Future<Question> get(String id) {
    // TODO: implement getQuestion
    throw UnimplementedError();
  }

  @override
  Future<List<Question>> getAll() {
    // TODO: implement getQuestions
    throw UnimplementedError();
  }
}
