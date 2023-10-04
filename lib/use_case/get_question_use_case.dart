import 'package:share_study_app/data/domain/question_use_case_model.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:share_study_app/use_case/use_case.dart';

class GetQuestionUseCase extends UseCase<String, Future<QuestionUseCaseModel>> {
  final QuestionRepository _questionRepository;
  final UserAuthRepository _userAuthRepository;

  GetQuestionUseCase(this._questionRepository, this._userAuthRepository);

  @override
  Future<QuestionUseCaseModel> call(param) async {
    final user = _userAuthRepository.getCurrentUser();
    return await _questionRepository.get(param).then(
      (value) {
        return QuestionUseCaseModel(
          question: value,
          isMyQuestion:
              user?.id != null ? user!.id == value.questioner.id : false,
        );
      },
    );
  }
}
