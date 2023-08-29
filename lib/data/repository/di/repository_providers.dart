import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/firebase/firestore_providers.dart';
import 'package:share_study_app/data/repository/answer_repository.dart';
import 'package:share_study_app/data/repository/firestore_answer_repository.dart';
import 'package:share_study_app/data/repository/firestore_question_repository.dart';
import 'package:share_study_app/data/repository/firestore_subject_repository.dart';
import 'package:share_study_app/data/repository/question_repository.dart';
import 'package:share_study_app/data/repository/subject_repository.dart';

final answerRepositoryProvider = Provider<AnswerRepository>((ref) {
  final answerCollectoinRef = ref.watch(answersCollectionRefProvider);
  return FirestoreAnswerRepository(answerCollectoinRef);
});

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  final questionCollectoinRef = ref.watch(questionsCollectionRefProvider);
  return FirestoreQuestionRepository(questionCollectoinRef);
});

final subjectRepositoryProvider = Provider<SubjectRepository>((ref) {
  final subjectCollectoinRef = ref.watch(subjectsCollectionRefProvider);
  return FirestoreSubjectRepository(subjectCollectoinRef);
});
