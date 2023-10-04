import 'package:share_study_app/data/domain/question_use_case_model.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/pagination_by_profile_id_args.dart';

class GetQuestionsWithPaginationAndProfileIdUseCase extends UseCase<
    PaginationByProfileIdArgs, Future<List<QuestionUseCaseModel>>> {
  final QuestionRepository _questionRepository;

  GetQuestionsWithPaginationAndProfileIdUseCase(this._questionRepository);

  @override
  Future<List<QuestionUseCaseModel>> call(param) {
    return _questionRepository
        .getWithPaginationAndProfileId(param.start, param.end, param.profileId)
        .then((value) {
      return value
          .map((e) => QuestionUseCaseModel(
                question: e,
                isMyQuestion: e.questioner.id == param.profileId,
              ))
          .toList();
    });
  }
}
