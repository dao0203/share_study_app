import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_study_app/data/domain/subject.dart';
import 'package:share_study_app/data/repository/subject_repository.dart';

final class FirestoreSubjectRepository implements SubjectRepository {
  final CollectionReference _subjectCollectionRef;

  FirestoreSubjectRepository(this._subjectCollectionRef);
  @override
  Future<List<Subject>> getSubjects() async {
    return await _subjectCollectionRef.get().then((value) => value.docs
        .map((e) => Subject(
              id: e.id,
              name: e["name"],
              course: e["course"],
            ))
        .toList());
  }

  @override
  Stream<List<Subject>> getResearchSubjectsStream(String keyWord) {
    return _subjectCollectionRef.snapshots().map((snapshot) => snapshot.docs
        .map((e) => Subject(
              id: e.id,
              name: e["name"],
              course: e["course"],
            ))
        .toList());
  }
}
