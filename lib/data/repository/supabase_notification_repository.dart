import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/notification.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/notification_respository.dart';
import 'package:share_study_app/util/notification_type.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseNotificationRepository implements NotificationRepository {
  final _client = Supabase.instance.client;

  @override
  Future<List<Notification>> getWithPagination(int start, int end) async {
    return await _client
        .from('notifications')
        .select<PostgrestList>('''
    id, created_at, type,
    question_id (id, title, content, created_at, updated_at),
    sender_id (id, nickname,university_name,image_url)
  ''')
        .eq('receiver_id', _client.auth.currentUser!.id)
        .then((value) {
          Logger().i('getWithPagination.then: $value');
          return value.map((e) {
            return Notification(
              id: e['id'] as String,
              sender: e['sender_id'] == null
                  ? null
                  : Profile(
                      id: e['sender_id']['id'] as String,
                      nickname: e['sender_id']['nickname'] as String,
                      universityName:
                          e['sender_id']['university_name'] as String,
                      imageUrl: e['sender_id']['image_url'] as String?,
                    ),
              type: NotificationType.values.firstWhere(
                (element) => element.value == e['type'] as String,
              ),
              questionId: e['question_id'] == null
                  ? null
                  : e['question_id']['id'] as String?,
              questionContent: e['question_id'] == null
                  ? null
                  : e['question_id']['content'] as String?,
              createdAt: DateTime.parse(e['created_at']),
            );
          }).toList();
        })
        .catchError((error, stacktrace) {
          Logger().e('getWithPagination.error: $error $stacktrace');
          throw error;
        });
  }
}
