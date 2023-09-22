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
    final user = _userRepository.getCurrentUser();
    return await _profileRepository.getProfile(user!.id);
  }
}
