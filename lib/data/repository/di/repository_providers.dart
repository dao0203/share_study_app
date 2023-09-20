import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/profile_repository.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
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
