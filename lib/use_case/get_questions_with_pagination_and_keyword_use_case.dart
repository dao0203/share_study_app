import 'package:share_study_app/data/domain/question_use_case_model.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/pagination_by_keyword_args.dart';

class GetQuestionsWithPaginationAndKeywordUseCase
    implements
        UseCase<PaginationByKeywordArgs, Future<List<QuestionUseCaseModel>>> {
  final QuestionRepository _questionRepository;
  final UserAuthRepository _userAuthRepository;

  GetQuestionsWithPaginationAndKeywordUseCase(
    this._questionRepository,
    this._userAuthRepository,
  );

  @override
  Future<List<QuestionUseCaseModel>> call({
    required PaginationByKeywordArgs param,
  }) async {
    final user = _userAuthRepository.getCurrentUser();
    return await _questionRepository
        .getWithPaginationAndKeyword(
      offsetAmount: param.offsetAmount,
      limitAmount: param.limitAmount,
      keyword: param.keyword,
    )
        .then((value) {
      return value
          .map(
            (e) => QuestionUseCaseModel(
              question: e,
              isMyQuestion: (user?.id ?? '') == e.id,
            ),
          )
          .toList();
    });
  }
}
