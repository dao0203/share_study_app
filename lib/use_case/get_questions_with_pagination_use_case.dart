import 'package:share_study_app/data/domain/question_use_case_model.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/pagination_args.dart';

class GetQuestionsWithPaginationUseCase
    extends UseCase<PaginationArgs, Future<List<QuestionUseCaseModel>>> {
  final QuestionRepository _questionRepository;
  final UserAuthRepository _userAuthRepository;
  GetQuestionsWithPaginationUseCase(
      this._questionRepository, this._userAuthRepository);
  @override
  Future<List<QuestionUseCaseModel>> call(
      {required PaginationArgs param}) async {
    final user = _userAuthRepository.getCurrentUser();
    return await _questionRepository
        .getWithPagination(
      offset: param.offset,
      limit: param.limit,
    )
        .then((value) {
      return value.map((e) {
        return QuestionUseCaseModel(
          question: e,
          isMyQuestion: user?.id == null ? false : user!.id == e.questioner.id,
        );
      }).toList();
    });
  }
}
