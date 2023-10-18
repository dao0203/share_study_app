import 'package:share_study_app/data/domain/question_use_case_model.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/pagination_by_profile_id_args.dart';

class GetQuestionsWithPaginationAndProfileIdUseCase extends UseCase<
    PaginationByProfileIdArgs, Future<List<QuestionUseCaseModel>>> {
  final QuestionRepository _questionRepository;
  final UserAuthRepository _userAuthRepository;

  GetQuestionsWithPaginationAndProfileIdUseCase(
    this._questionRepository,
    this._userAuthRepository,
  );

  @override
  Future<List<QuestionUseCaseModel>> call({
    required PaginationByProfileIdArgs param,
  }) async {
    final user = _userAuthRepository.getCurrentUser();
    return await _questionRepository
        .getWithPaginationAndProfileId(param.start, param.end, param.profileId)
        .then((value) {
      return value
          .map((e) => QuestionUseCaseModel(
                question: e,
                isMyQuestion: param.profileId == (user?.id ?? ''),
              ))
          .toList();
    });
  }
}
