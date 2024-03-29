import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/use_case/get_my_notifications_use_case.dart';
import 'package:share_study_app/use_case/get_my_profile_use_case.dart';
import 'package:share_study_app/use_case/get_profile_use_case.dart';
import 'package:share_study_app/use_case/get_question_use_case.dart';
import 'package:share_study_app/use_case/get_questions_with_pagination_and_keyword_use_case.dart';
import 'package:share_study_app/use_case/get_questions_with_pagination_and_profile_id_use_case.dart';
import 'package:share_study_app/use_case/get_questions_with_pagination_use_case.dart';
import 'package:share_study_app/use_case/get_resolved_questions_with_pagination_and_profile_id_use_case.dart';
import 'package:share_study_app/use_case/set_up_splash_use_case.dart';

final getMyProfileUseCaseProvider = Provider<GetMyProfileUseCase>((ref) {
  return GetMyProfileUseCase(
    ref.watch(profileRepositoryProvider),
    ref.watch(userAuthRepositoryProvider),
  );
});

final setUpSplashUseCaseProvider = Provider<SetUpSplashUseCase>((ref) {
  return SetUpSplashUseCase(
    ref.watch(userAuthRepositoryProvider),
    ref.watch(getMyProfileUseCaseProvider),
  );
});

final getMyNotificationsWithPaginationUseCaseProvider =
    Provider<GetMyNotificationsWithPaginationUseCase>((ref) {
  return GetMyNotificationsWithPaginationUseCase(
    ref.watch(notificationRepositoryProvider),
  );
});

final getProfileUseCaseProvider = Provider<GetProfileUseCase>((ref) {
  return GetProfileUseCase(
    ref.watch(profileRepositoryProvider),
    ref.watch(userAuthRepositoryProvider),
  );
});

final getQuestionsWithPaginationUseCaseProvider =
    Provider<GetQuestionsWithPaginationUseCase>((ref) {
  return GetQuestionsWithPaginationUseCase(
    ref.watch(questionRepositoryProvider),
    ref.watch(userAuthRepositoryProvider),
  );
});

final getQuestionUseCaseProvider = Provider<GetQuestionUseCase>((ref) {
  return GetQuestionUseCase(
    ref.watch(questionRepositoryProvider),
    ref.watch(userAuthRepositoryProvider),
  );
});

final getQuestionsWithPaginationAndProfileIdUseCase =
    Provider<GetQuestionsWithPaginationAndProfileIdUseCase>((ref) {
  return GetQuestionsWithPaginationAndProfileIdUseCase(
    ref.watch(questionRepositoryProvider),
    ref.watch(userAuthRepositoryProvider),
  );
});

final getQuestionsWithPaginationAndKeywordUseCaseProvider =
    Provider<GetQuestionsWithPaginationAndKeywordUseCase>((ref) {
  return GetQuestionsWithPaginationAndKeywordUseCase(
    ref.watch(questionRepositoryProvider),
    ref.watch(userAuthRepositoryProvider),
  );
});

final getResolvedQuestionsWithPaginationAndProfileIdUseCaseProvider =
    Provider<GetResolvedQuestionsWithPaginationAndProfileIdUseCase>((ref) {
  return GetResolvedQuestionsWithPaginationAndProfileIdUseCase(
    ref.watch(questionRepositoryProvider),
  );
});
