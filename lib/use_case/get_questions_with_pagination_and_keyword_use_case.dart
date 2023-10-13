import 'package:share_study_app/data/domain/question_use_case_model.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/pagination_by_keyword_args.dart';

class GetQuestionsWithPaginationAndKeywordUseCase
    implements
        UseCase<PaginationByKeywordArgs, Future<List<QuestionUseCaseModel>>> {
  final QuestionRepository _questionRepository;

  GetQuestionsWithPaginationAndKeywordUseCase(this._questionRepository);

  @override
  Future<List<QuestionUseCaseModel>> call({
    required PaginationByKeywordArgs param,
  }) {
    return _questionRepository
        .getWithPaginationAndKeyword(param.start, param.end, param.keyword)
        .then((value) {
      return value
          .map((e) => QuestionUseCaseModel(
                question: e,
                isMyQuestion: false,
              ))
          .toList();
    });
  }
}
