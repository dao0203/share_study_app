import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/answer_repository.dart';
import 'package:share_study_app/data/repository/notification_respository.dart';
import 'package:share_study_app/data/repository/profile_repository.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/data/repository/supabase_answer_repository.dart';
import 'package:share_study_app/data/repository/supabase_notification_repository.dart';
import 'package:share_study_app/data/repository/supabase_profile_repository.dart';
import 'package:share_study_app/data/repository/supabase_question_repository.dart';
import 'package:share_study_app/data/repository/supabase_user_auth_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return SupabaseQuestionRepository();
});

final userAuthRepositoryProvider = Provider<UserAuthRepository>((ref) {
  return SupabaseUserAuthRepository();
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return SupabaseProfileRepository();
});

final answerRepositoryProvider = Provider<AnswerRepository>((ref) {
  return SupabaseAnswerRepository();
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return SupabaseNotificationRepository();
});
