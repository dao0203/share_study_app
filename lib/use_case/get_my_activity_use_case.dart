import 'package:share_study_app/data/domain/activity.dart';
import 'package:share_study_app/data/repository/activity_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';

class GetMyActivityUseCase extends UseCase<void, Future<Activity>> {
  final ActivityRepository _activityRepository;
  final UserAuthRepository _userAuthRepository;

  GetMyActivityUseCase(this._activityRepository, this._userAuthRepository);

  @override
  Future<Activity> call(void param) async {
    final userId = _userAuthRepository.getCurrentUser()!.id;
    return await _activityRepository.get(userId);
  }
}
