import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/domain/questioner.dart';
import 'package:share_study_app/data/domain/subject.dart';
import 'package:share_study_app/data/repository/question_repository.dart';

final class FirestoreQuestionRepository implements QuestionRepository {
  final CollectionReference _questionsCollection;

  FirestoreQuestionRepository(this._questionsCollection);
  @override
  Future<void> addQuestion(Question question) async {
    await _questionsCollection.add({
      'title': question.title,
      'content': question.content,
      'imageUrl': question.imageUrl,
      'isResolved': false,
      'subject': {
        'id': question.subject.id,
        'name': question.subject.name,
        'course': question.subject.course,
      },
      'createdAt': Timestamp.now(),
      'updatedAt': Timestamp.now(),
    });
  }

  @override
  Future<Question> getQuestion(String id) async {
    return await _questionsCollection.doc(id).get().then(
          (value) => Question(
            id: value.id,
            title: value['title'],
            content: value['content'],
            imageUrl: value['imageUrl'],
            isResolved: value['isResolved'],
            questioner: Questioner(
              id: value['questioner']['id'],
              lastName: value['questioner']['lastName'],
              firstName: value['questioner']['firstName'],
              grade: value['questioner']['grade'],
              imageUrl: value['questioner']['imageUrl'],
            ),
            subject: Subject(
              id: value['subject']['id'],
              name: value['subject']['name'],
              course: value['subject']['course'],
            ),
            createdAt: value['createdAt'].toDate(),
            updatedAt: value['updatedAt'].toDate(),
          ),
        );
  }

  @override
  Future<List<Question>> getQuestions() async {
    return await _questionsCollection.get().then(
          (value) => value.docs
              .map(
                (e) => Question(
                  id: e.id,
                  title: e['title'],
                  content: e['content'],
                  imageUrl: e['imageUrl'],
                  isResolved: e['isResolved'],
                  questioner: Questioner(
                    id: e['questioner']['id'],
                    lastName: e['questioner']['lastName'],
                    firstName: e['questioner']['firstName'],
                    grade: e['questioner']['grade'],
                    imageUrl: e['questioner']['imageUrl'],
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
