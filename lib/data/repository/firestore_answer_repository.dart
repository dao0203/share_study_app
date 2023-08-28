import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/domain/answerer.dart';
import 'package:share_study_app/data/domain/subject.dart';
import 'package:share_study_app/data/repository/answer_repository.dart';

final class FirestoreAnswerRepository implements AnswerRepository {
  final CollectionReference _answersCollection;

  FirestoreAnswerRepository(this._answersCollection);

  @override
  Future<void> addAnswer(Answer answer) async {
    await _answersCollection.add({
      'questionId': answer.questionId,
      'content': answer.content,
      'imageUrl': answer.imageUrl,
      'isBestAnswer': false,
      'subject': {
        'id': answer.subject.id,
        'name': answer.subject.name,
        'course': answer.subject.course,
      },
      'createdAt': Timestamp.now(),
      'updatedAt': Timestamp.now(),
    });
  }

  @override
  Future<List<Answer>> getAnswers() async {
    return await _answersCollection.get().then(
          (value) => value.docs
              .map(
                (e) => Answer(
                  id: e.id,
                  questionId: e['questionId'],
                  content: e['content'],
                  imageUrl: e['imageUrl'],
                  isBestAnswer: e['isBestAnswer'],
                  answerer: Answerer(
                    id: e['answerer']['id'],
                    lastName: e['answerer']['lastName'],
                    firstName: e['answerer']['firstName'],
                    imageUrl: e['answerer']['imageUrl'],
                  ),
                  subject: Subject(
                    id: e['subject']['id'],
                    name: e['subject']['name'],
                    course: e['subject']['course'],
                  ),
                  createdAt: e['createdAt'].toDate(),
                  updatedAt: e['updatedAt'].toDate(),
                ),
              )
              .toList(),
        );
  }
}
