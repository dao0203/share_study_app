import 'package:share_study_app/data/domain/question_use_case_model.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/pagination_by_profile_id_args.dart';

class GetResolvedQuestionsWithPaginationAndProfileIdUseCase extends UseCase<
    PaginationByProfileIdArgs, Future<List<QuestionUseCaseModel>>> {
  final QuestionRepository _questionRepository;

  GetResolvedQuestionsWithPaginationAndProfileIdUseCase(
    this._questionRepository,
  );
  @override
  Future<List<QuestionUseCaseModel>> call({
    required PaginationByProfileIdArgs param,
  }) async {
    return _questionRepository
        .getResolvedWithPaginationAndProfileId(
      param.profileId,
      param.start,
      param.end,
    )
        .then((value) {
      return value
          .map(
            (e) => QuestionUseCaseModel(
              question: e,
              isMyQuestion: e.questioner.id == param.profileId,
            ),
          )
          .toList();
    });
  }
}
