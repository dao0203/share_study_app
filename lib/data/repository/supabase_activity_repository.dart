import 'package:share_study_app/data/domain/activity.dart';
import 'package:share_study_app/data/repository/activity_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseActivityRepository implements ActivityRepository {
  final SupabaseClient _client = Supabase.instance.client;
  @override
  Future<Activity> get(String id) async {
    return await _client.from('activities').select().eq("id", id).then((value) {
      return Activity(
        id: value['id'],
        followCount: value['follow_count'],
        followerCount: value['follower_count'],
        questionCount: value['question_count'],
        answerCount: value['answer_count'],
        bestAnswerCount: value['best_answer_count'],
        repostCount: value['repost_count'],
        likeCount: value['like_count'],
      );
    });
  }
}
