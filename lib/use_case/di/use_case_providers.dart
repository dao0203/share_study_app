import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/use_case/get_my_notifications_use_case.dart';
import 'package:share_study_app/use_case/get_my_profile_use_case.dart';
import 'package:share_study_app/use_case/get_profile_use_case.dart';
import 'package:share_study_app/use_case/set_up_splash_use_case.dart';
import 'package:share_study_app/use_case/update_answer_use_case.dart';


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

final updateAnswerUseCaseProvider = Provider<UpdateAnswerUseCase>((ref) {
  return UpdateAnswerUseCase(
    ref.watch(answerRepositoryProvider),
  );
});
