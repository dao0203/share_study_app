import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/activity.dart';
import 'package:share_study_app/data/repository/activity_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseActivityRepository implements ActivityRepository {
  final SupabaseClient _client = Supabase.instance.client;
  @override
  Future<Activity> get(String id) async {
    return await _client
        .from('activities')
        .select()
        .eq("id", id)
        .limit(1)
        .single()
        .then((value) {
      Logger().i("activity: $value");
      return Activity(
        id: value['id'] as String,
        followCount: value['follow_count'] as int,
        followerCount: value['follower_count'] as int,
        questionCount: value['question_count'] as int,
        answerCount: value['answer_count'] as int,
        bestAnswerCount: value['best_answer_count'] as int,
        likeCount: value['like_count'] as int,
        repostCount: value['repost_count'] as int,
      );
    });
  }
}
