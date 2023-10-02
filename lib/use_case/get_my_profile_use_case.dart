import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/profile_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';

class GetMyProfileUseCase extends UseCase<void, Future<Profile>> {
  final ProfileRepository _profileRepository;
  final UserAuthRepository _userRepository;

  GetMyProfileUseCase(
    this._profileRepository,
    this._userRepository,
  );

  @override
  Future<Profile> call(param) async {
    Logger().i('GetMyProfileUseCase');
    final user = _userRepository.getCurrentUser();
    //userがnullの場合は3回くらいリトライする
    if (user?.id == null) {
      for (var i = 0; i < 3; i++) {
        Logger().i('GetMyProfileUseCase retry');
        await Future.delayed(const Duration(seconds: 1));
        final retryData = _userRepository.getCurrentUser();
        if (retryData != null) {
          return await _profileRepository.getProfile(retryData.id);
        }
      }
    }
    return await _profileRepository.getProfile(user!.id);
  }
}
