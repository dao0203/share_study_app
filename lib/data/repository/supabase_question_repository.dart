import 'dart:io';

import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

final class SupabaseQuestionRepository implements QuestionRepository {
  final _client = Supabase.instance.client;
  final _uuid = const Uuid();
  @override
  Future<void> add(
      String title, String content, String tags, String? path) async {
    Logger().d('supabaseQuestionRepository.add pressed');
    //uuidを生成
    final uuid = _uuid.v4();
    await _client.from('questions').insert({
      'id': uuid,
      'title': title,
      'tags': [tags],
      'content': content,
    }).then((value) {
      Logger().d('addQuestion.then: $value');
      //画像がある場合
      if (path != null) {
        _client.storage
            .from('questions')
            .upload('$uuid.png', File(path))
            .then((value) async {
          Logger().d('uploadImage.then: $value');
          //画像のURLを取得
          final imageUrl =
              _client.storage.from('questions').getPublicUrl('$uuid.png');
          Logger().d('imageUrl: $imageUrl');
          //画像のURLを更新
          await _client
              .from('questions')
              .update({
                'image_url': imageUrl,
              })
              .eq('id', uuid)
              .then((value) {
                Logger().d('update imageurl success');
              })
              .onError((error, stacktrace) {
                Logger().e('updateImageUrl.error: $error $stacktrace');
                throw Exception('failed to update image url');
              });
        }).onError((error, stacktrace) {
          Logger().e('uploadImage.error: $error $stacktrace');
          throw Exception('failed to upload image');
        });
      }
    }).onError((error, stacktrace) {
      Logger().e('addQuestion.error: $error $stacktrace');
      throw Exception('failed to add question');
    });
  }

  @override
  Future<Question> get(String id) async {
    return await _client
        .from('questions')
        .select<PostgrestMap>(
          '''
          id,user_id, image_url, title, tags, content, is_resolved, created_at, updated_at,
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
            tags: value['tags'][0] as String,
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
  Future<List<Question>> getWithPagination({
    required int offset,
    required int limit,
  }) async {
    return await _client.rpc(
      'get_questions_with_pagination',
      params: {
        'offset_amount': offset,
        'limit_amount': limit,
      },
    ).then((value) async {
      Logger().i('getWithPagination.then: $value');
      //valueをリスト型に変換
      final valueListDynamic = value as List<dynamic>;
      final valueList = valueListDynamic.cast<Map<String, dynamic>>();
      return valueList.map((question) {
        return Question(
          //questions
          id: question['question_id'] as String,
          title: question['title'] as String,
          tags: question['tags'][0] as String,
          content: question['content'] as String,
          isResolved: question['is_resolved'] as bool,
          createdAt: DateTime.parse(question['created_at']),
          updatedAt: DateTime.parse(question['updated_at']),
          imageUrl: question['image_url'] as String?,
          //profiles
          questioner: Profile(
            id: question['questioner_user_id'] as String,
            nickname: question['questioner_nickname'] as String,
            universityName: question['questioner_university_name'] as String,
            imageUrl: question['questioner_image_url'] as String?,
          ),
        );
      }).toList();
    }).catchError((error, stacktrace) {
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
  Future<List<Question>> getWithPaginationAndKeyword({
    required int offsetAmount,
    required int limitAmount,
    required String keyword,
  }) async {
    return await _client.rpc(
      'get_questions_with_pagination_and_keyword',
      params: {
        'offset_amount': offsetAmount,
        'limit_amount': limitAmount,
        'keyword': keyword,
      },
    ).then((value) {
      Logger().i('getWithPaginationAndKeyword.then: $value');
      final valueListDynamic = value as List<dynamic>;
      final valueList = valueListDynamic.cast<Map<String, dynamic>>();
      return valueList.map((e) {
        return Question(
          //questions
          id: e['question_id'] as String,
          title: e['title'] as String,
          tags: e['tags'][0] as String,
          content: e['content'] as String,
          isResolved: e['is_resolved'] as bool,
          createdAt: DateTime.parse(e['created_at']),
          updatedAt: DateTime.parse(e['updated_at']),
          imageUrl: e['image_url'] as String?,
          //profiles
          questioner: Profile(
            id: e['questioner_user_id'] as String,
            nickname: e['questioner_nickname'] as String,
            universityName: e['questioner_university_name'] as String,
            imageUrl: e['questioner_image_url'] as String?,
          ),
        );
      }).toList();
    }).catchError((error, stacktrace) {
      Logger().e('getWithPaginationAndKeyword.error: $error, $stacktrace');
      throw error;
    });
  }

  @override
  Future<List<Question>> getWithPaginationAndProfileId(
      int start, int end, String userId) async {
    return await _client
        .from('questions')
        .select<PostgrestList>(''' 
          id,user_id, image_url, title, tags, content, is_resolved, created_at, updated_at,
          profiles (nickname,university_name,image_url)
          ''')
        .eq('user_id', userId)
        .range(start, end)
        .then((value) {
          Logger().i('getWithPaginationAndUserId.then: $value');
          return value.map((e) {
            return Question(
              //questions
              id: e['id'] as String,
              title: e['title'] as String,
              tags: e['tags'][0] as String,
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

  @override
  Future<List<Question>> getResolvedWithPaginationAndProfileId(
      String profileId, int start, int end) async {
    return await _client
        .from('questions')
        .select<PostgrestList>(
          '''
  id,user_id, image_url, title, tags, content, is_resolved, created_at, updated_at,
          profiles (nickname,university_name,image_url)
''',
        )
        .eq('is_resolved', true)
        .eq('user_id', profileId)
        .range(start, end)
        .then((value) {
          Logger().i('getResolvedWithPaginationAndProfileId.then: $value');
          return value.map((e) {
            return Question(
              //questions
              id: e['id'] as String,
              title: e['title'] as String,
              tags: e['tags'][0] as String,
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
          Logger().e(
              'getResolvedWithPaginationAndProfileId.error: $error, $stacktrace');
          throw error;
        });
  }

  @override
  Future<void> delete({required String questionId}) async {
    await _client.from('questions').delete().eq('id', questionId).then((value) {
      Logger().d('delete question success');
    }).catchError((error, stacktrace) {
      Logger().e('deleteQuestion.error: $error $stacktrace');
      throw Exception('failed to delete question');
    });
  }

  @override
  Future<void> reportQuestion({
    required String questionId,
    required String reason,
    required bool wantToHideQuestion,
  }) async {
    await _client.rpc('report_question', params: {
      'question_id': questionId,
      'reason': reason,
      'want_to_hide_question': wantToHideQuestion,
    }).then((value) {
      Logger().d('reportQuestion.then: $value');
    }).catchError((error, stacktrace) {
      Logger().e('reportQuestion.error: $error $stacktrace');
      throw Exception('failed to report question');
    });
  }

  @override
  Future<void> hide({required String questionId}) async {
    await _client.from('hidden_questions').insert({
      'question_id': questionId,
      'profile_id': _client.auth.currentUser!.id,
    }).then((value) {
      Logger().d('hide question success');
    }).catchError((error, stacktrace) {
      Logger().e('hideQuestion.error: $error $stacktrace');
      throw Exception('failed to hide question');
    });
  }
}
