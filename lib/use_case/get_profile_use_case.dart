import 'package:share_study_app/data/domain/activity_profile.dart';
import 'package:share_study_app/data/repository/profile_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';

class GetProfileUseCase extends UseCase<String, Future<ActivityProfile>> {
  final ProfileRepository _profileRepository;
  final UserAuthRepository _userAuthRepository;

  GetProfileUseCase(this._profileRepository, this._userAuthRepository);
  @override
  Future<ActivityProfile> call({
    required String param,
  }) async {
    final currentUser = _userAuthRepository.getCurrentUser();
    return await _profileRepository.getProfile(param).then((value) {
      return ActivityProfile(
        profile: value,
        questionCount: value.questionCount!,
        answerCount: value.answerCount!,
        bestAnswerCount: value.bestAnswerCount!,
        isMyProfile: currentUser?.id == value.id,
      );
    });
  }
}
