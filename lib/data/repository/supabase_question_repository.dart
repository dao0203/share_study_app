import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseQuestionRepository implements QuestionRepository {
  final _client = Supabase.instance.client;
  @override
  Future<void> add(String title, String content, String subjectName) async {
    Logger().d('supabaseQuestionRepository.add pressed');
    await _client.from('questions').insert({
      'title': title,
      'subject_name': subjectName,
      'content': content,
    }).then((value) {
      Logger().d('addQuestion.then: $value');
    }).catchError((error, stacktrace) {
      Logger().e('addQuestion.error: $error $stacktrace');
    });
  }

  @override
  Future<Question> get(String id) async {
    return await _client
        .from('questions')
        .select<PostgrestMap>(
          '''
          id,user_id, image_url, title, subject_name, content, is_resolved, created_at, updated_at,
          profiles (nickname,university_name,image_url)
          ''',
        )
        .eq('id', id)
        .single()
        .then((value) {
          Logger().i('getQuestion.then: $value');
          return Question(
            //questions
            id: value['id'] as String,
            title: value['title'] as String,
            subjectName: value['subject_name'] as String,
            content: value['content'] as String,
            isResolved: value['is_resolved'] as bool,
            createdAt: DateTime.parse(value['created_at']),
            updatedAt: DateTime.parse(value['updated_at']),
            imageUrl: value['image_url'] as String?,
            //profiles
            questioner: Profile(
              id: value['user_id'] as String,
              nickname: value['profiles']['nickname'] as String,
              universityName: value['profiles']['university_name'] as String,
              imageUrl: value['profiles']['image_url'] as String?,
            ),
          );
        })
        .catchError((error, stacktrace) {
          Logger().e('getQuestion.error: $error, $stacktrace');
          throw error;
        });
  }

  @override
  Future<List<Question>> getAll() {
    // TODO: implement getQuestions
    throw UnimplementedError();
  }

  @override
  Future<List<Question>> getWithPagination(int start, int end) async {
    return await _client
        .from('questions')
        .select<PostgrestList>(
          ''' 
          id,user_id, image_url, title, subject_name, content, is_resolved, created_at, updated_at,
          profiles (nickname,university_name,image_url)
          ''',
        )
        .range(start, end)
        .then((value) {
          Logger().i('getWithPagination.then: $value');
          //valueをリスト型に変換
          return value.map((e) {
            return Question(
              //questions
              id: e['id'] as String,
              title: e['title'] as String,
              subjectName: e['subject_name'] as String,
              content: e['content'] as String,
              isResolved: e['is_resolved'] as bool,
              createdAt: DateTime.parse(e['created_at']),
              updatedAt: DateTime.parse(e['updated_at']),
              imageUrl: e['image_url'] as String?,
              //profiles
              questioner: Profile(
                id: e['user_id'] as String,
                nickname: e['profiles']['nickname'] as String,
                universityName: e['profiles']['university_name'] as String,
                imageUrl: e['profiles']['image_url'] as String?,
              ),
            );
          }).toList();
        })
        .catchError((error, stacktrace) {
          Logger().e('getWithPagination.error: $error, $stacktrace');
          throw error;
        });
  }

  @override
  Future<void> bookmark(String id) async {
    await _client.from('bookmarks').insert({
      'question_id': id,
    }).then((value) {
      Logger().d('bookmarkQuestion.then: $value');
    }).catchError((error, stacktrace) {
      Logger().e('bookmarkQuestion.error: $error $stacktrace');
    });
  }

  @override
  Future<void> unbookmark(String id) async {
    await _client
        .from('bookmarks')
        .delete()
        .eq('question_id', id)
        .then((value) {
      Logger().d('unbookmarkQuestion.then: $value');
    }).catchError((error, stacktrace) {
      Logger().e('unbookmarkQuestion.error: $error $stacktrace');
    });
  }

  @override
  Future<List<Question>> getWithPaginationAndKeyword(
      int start, int end, String keyword) async {
    Logger().d('getWithPaginationAndKeyword: $keyword');
    return await _client
        .from('questions')
        .select<PostgrestList>(
          ''' 
          id,user_id, image_url, title, subject_name, content, is_resolved, created_at, updated_at,
          profiles (nickname,university_name,image_url)
          ''',
        )
        //曖昧検索
        .or('or(title.ilike.%$keyword%,content.ilike.%$keyword%,subject_name.ilike.%$keyword%))')
        .range(start, end)
        .then((value) {
          Logger().i('getWithPaginationAndKeyword.then: $value');
          return value.map((e) {
            return Question(
              //questions
              id: e['id'] as String,
              title: e['title'] as String,
              subjectName: e['subject_name'] as String,
              content: e['content'] as String,
              isResolved: e['is_resolved'] as bool,
              createdAt: DateTime.parse(e['created_at']),
              updatedAt: DateTime.parse(e['updated_at']),
              imageUrl: e['image_url'] as String?,
              //profiles
              questioner: Profile(
                id: e['user_id'] as String,
                nickname: e['profiles']['nickname'] as String,
                universityName: e['profiles']['university_name'] as String,
                imageUrl: e['profiles']['image_url'] as String?,
              ),
            );
          }).toList();
        })
        .catchError((error, stacktrace) {
          Logger().e('getWithPaginationAndKeyword.error: $error, $stacktrace');
          throw error;
        });
  }

  @override
  Future<List<Question>> getWithPaginationAndUserId(
      int start, int end, String userId) async {
    return await _client
        .from('questions')
        .select<PostgrestList>(''' 
          id,user_id, image_url, title, subject_name, content, is_resolved, created_at, updated_at,
          profiles (nickname,university_name,image_url)
          ''')
        .eq('user_id', userId)
        .range(start, end)
        .then((value) {
          return value.map((e) {
            return Question(
              //questions
              id: e['id'] as String,
              title: e['title'] as String,
              subjectName: e['subject_name'] as String,
              content: e['content'] as String,
              isResolved: e['is_resolved'] as bool,
              createdAt: DateTime.parse(e['created_at']),
              updatedAt: DateTime.parse(e['updated_at']),
              imageUrl: e['image_url'] as String?,
              //profiles
              questioner: Profile(
                id: e['user_id'] as String,
                nickname: e['profiles']['nickname'] as String,
                universityName: e['profiles']['university_name'] as String,
                imageUrl: e['profiles']['image_url'] as String?,
              ),
            );
          }).toList();
        })
        .catchError((error, stacktrace) {
          Logger().e('getWithPaginationAndUserId.error: $error, $stacktrace');
          throw error;
        });
  }
}
