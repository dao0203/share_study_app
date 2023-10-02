import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/answer_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseAnswerRepository implements AnswerRepository {
  final _client = Supabase.instance.client;

  @override
  Future<void> addAnswer(String questionId, String content) async {
    await _client.from('answers').insert({
      'question_id': questionId,
      'content': content,
    }).then((value) {
      Logger().d('addAnswer.then: $value');
    }).catchError((error, stacktrace) {
      Logger().e('addAnswer.error: $error $stacktrace');
      throw error;
    });
  }

  @override
  Future<List<Answer>> getAnswers() {
    // TODO: implement getAnswers
    throw UnimplementedError();
  }

  @override
  Future<List<Answer>> getAnswersByQuestionIdWithPagination(
    String questionId,
    int start,
    int end,
  ) async {
    return await _client
        .from('answers')
        .select<PostgrestList>(
          '''
          id, user_id, question_id, content, is_best_answer, created_at, updated_at,
          profiles (nickname,university_name,image_url)
          ''',
        )
        .eq('question_id', questionId)
        .order('created_at', ascending: false)
        .range(start, end)
        .then(
          (value) {
            Logger().i('getAnswersByQuestionIdWithPagination.then: $value');
            //valueをリスト型に変換
            return value.map(
              (e) {
                return Answer(
                  id: e['id'] as String,
                  questionId: e['question_id'] as String,
                  content: e['content'] as String,
                  isBestAnswer: e['is_best_answer'] as bool,
                  createdAt: DateTime.parse(e['created_at']),
                  updatedAt: DateTime.parse(e['updated_at']),
                  //profiles
                  answerer: Profile(
                    id: e['user_id'] as String,
                    nickname: e['profiles']['nickname'] as String,
                    universityName: e['profiles']['university_name'] as String,
                    imageUrl: e['profiles']['image_url'] as String?,
                  ),
                );
              },
            ).toList();
          },
        )
        .catchError((error, stacktrace) {
          Logger().e(
              'getAnswersByQuestionIdWithPagination.error: $error $stacktrace');
          throw error;
        });
  }

  @override
  Future<List<Answer>> getAnswersByProfileIdWithPagination(
      String profileId, int start, int end) async {
    return await _client
        .from('answers')
        .select<PostgrestList>(
          '''
id, user_id, question_id, content, is_best_answer, created_at, updated_at,
profiles (nickname,university_name,image_url),
questions (title, user_id, profiles(image_url))
          ''',
        )
        .eq('user_id', profileId)
        .order('created_at', ascending: false)
        .range(start, end)
        .then(
          (value) {
            Logger().i('getAnswersByProfileIdWithPagination.then: $value');
            return value.map(
              (e) {
                return Answer(
                  id: e['id'] as String,
                  questionId: e['question_id'] as String,
                  content: e['content'] as String,
                  isBestAnswer: e['is_best_answer'] as bool,
                  createdAt: DateTime.parse(e['created_at']),
                  updatedAt: DateTime.parse(e['updated_at']),
                  answerer: Profile(
                    id: e['user_id'] as String,
                    imageUrl: e['profiles']['image_url'] as String?,
                    nickname: e['profiles']['nickname'] as String,
                    universityName: e['profiles']['university_name'] as String,
                  ),
                  questionTitle: e['questions']['title'] as String,
                  questionerId: e['questions']['user_id'] as String,
                  questionerImageUrl:
                      e['questions']['profile']['image_url'] as String?,
                );
              },
            ).toList();
          },
        );
  }

  @override
  Future<void> updateIsBestAnswer(String answerId, bool isBestAnswer) async {
    await _client
        .from('answers')
        .update({'is_best_answer': !isBestAnswer})
        .eq('id', answerId)
        .catchError((error, stacktrace) {
          Logger().e('updateIsBestAnswer.error: $error $stacktrace');
          throw Exception('failed to update error: $error');
        });
  }
}
