import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/get_my_profile_use_case.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/splash.dart';

class SetUpSplashUseCase extends UseCase<void, Future<SplashTo>> {
  final UserAuthRepository _userAuthRepository;
  final GetMyProfileUseCase _getMyProfileUseCase;
  SetUpSplashUseCase(this._userAuthRepository, this._getMyProfileUseCase);
  @override
  call({
    required void param,
  }) async {
    final isUserSignedIn = _userAuthRepository.isUserSignedIn();

    if (!isUserSignedIn) {
      return SplashTo.signInScreen;
    }

    final myProfile = await _getMyProfileUseCase.call(param: null);

    if (myProfile.nickname.isEmpty || myProfile.universityName.isEmpty) {
      Logger().i('profile is not set');
      return SplashTo.profileScreen;
    }

    return SplashTo.timelineScreen;
  }
}
