import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/notification.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/notification_respository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseNotificationRepository implements NotificationRepository {
  final _client = Supabase.instance.client;
  @override
  Future<List<Notification>> getNotifications(String userId) async {
    return await _client
        .from('notifications')
        .select('''
          id, message, sender_id, question_id, created_at,
          profiles (nickname,university_name,image_url)
''')
        .eq('user_id', userId)
        .then(
          (value) {
            Logger().i('getNotifications.then: $value');
            //valueをリスト型に変換
            return value.map(
              (e) {
                return Notification(
                  id: e['id'] as String,
                  message: e['message'] as String,
                  sender: Profile(
                    id: e['sender_id'] as String,
                    nickname: e['nickname'] as String,
                    universityName: e['university_name'] as String,
                    imageUrl: e['image_url'] as String,
                  ),
                  questionId: e['question_id'] as String?,
                  createdAt: DateTime.parse(e['created_at']),
                );
              },
            ).toList();
          },
        )
        .catchError((error, stacktrace) {
          Logger().e('getNotifications.error: $error $stacktrace');
          throw error;
        });
  }
}
