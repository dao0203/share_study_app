import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/repository/answer_repositroy.dart';

final class FirestoreAnswerRepository implements AnswerRepository {
  final CollectionReference _answersCollection;

  FirestoreAnswerRepository(this._answersCollection);

  @override
  Future<void> createAnswer(Answer answer) async {
    await _answersCollection.add({});
  }

  @override
  Future<List<Answer>> getAnswers() {
    // TODO: implement getAnswers
    throw UnimplementedError();
  }
}
