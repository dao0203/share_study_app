import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/domain/questioner.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseQuestionRepository implements QuestionRepository {
  final _client = Supabase.instance.client;
  @override
  Future<void> add(Question question) async {
    await _client.from('questions').insert({
      'title': question.title,
      'subject_name': question.subjectName,
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

  @override
  Future<List<Question>> getWithPagination(int limit, int offset) async {
    return await _client
        .from('questions')
        .select(
            //question Tableのidを外部キーにしているquestion_metrics tableのいいね数と回答数も取得する
            //また、questions中にあるuser_idを外部キーにしているprofiles tableのnicknameも取得する
            ''' id,user_id, image_url, title,subject, content, is_resolved, created_at, updated_at,
                profiles (
                  nickname, 
                  image_url
                  ),
                question_metrics (
                  like_count,
                  repost_count,
                  answer_count
                  )
                ''')
        .range(offset, offset + limit - 1)
        .then((value) {
          Logger().d('getWithPagination.then: $value');
          return value.map((e) {
            return Question(
              //questions
              id: e['id'] as String,
              title: e['title'] as String,
              subjectName: e['subject_name'] as String,
              content: e['content'] as String,
              isResolved: e['is_resolved'] as bool,
              createdAt: e['created_at'] as DateTime,
              updatedAt: e['updated_at'] as DateTime,
              imageUrl: e['image_url'] as String,
              //profiles
              questioner: Questioner(
                id: e['user_id'] as String,
                nickname: e['profiles']['nickname'] as String,
                imageUrl: e['profiles']['image_url'] as String,
              ),
              //question_metrics
              likeCount: e['question_metrics']['like_count'] as int,
              repostCount: e['question_metrics']['repost_count'] as int,
              answerCount: e['question_metrics']['answer_count'] as int,
            );
          }).toList();
        })
        .catchError((error) {
          Logger().e('getWithPagination.error: $error');
        });
  }
}
