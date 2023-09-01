import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/firebase/firestore_providers.dart';
import 'package:share_study_app/data/repository/activity_repository.dart';
import 'package:share_study_app/data/repository/answer_repository.dart';
import 'package:share_study_app/data/repository/firestore_answer_repository.dart';
import 'package:share_study_app/data/repository/firestore_subject_repository.dart';
import 'package:share_study_app/data/repository/profile_repository.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/data/repository/subject_repository.dart';
import 'package:share_study_app/data/repository/supabase_activity_repository.dart';
import 'package:share_study_app/data/repository/supabase_profile_repository.dart';
import 'package:share_study_app/data/repository/supabase_question_repository.dart';
import 'package:share_study_app/data/repository/supabase_user_auth_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';

final answerRepositoryProvider = Provider<AnswerRepository>((ref) {
  final answerCollectoinRef = ref.watch(answersCollectionRefProvider);
  return FirestoreAnswerRepository(answerCollectoinRef);
});

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return SupabaseQuestionRepository();
});

final subjectRepositoryProvider = Provider<SubjectRepository>((ref) {
  final subjectCollectoinRef = ref.watch(subjectsCollectionRefProvider);
  return FirestoreSubjectRepository(subjectCollectoinRef);
});

final userAuthRepositoryProvider = Provider<UserAuthRepository>((ref) {
  return SupabaseUserAuthRepository();
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return SupabaseProfileRepository();
});

final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  return SupabaseActivityRepository();
});
