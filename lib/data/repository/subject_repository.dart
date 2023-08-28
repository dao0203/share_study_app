import 'package:share_study_app/data/domain/subject.dart';

abstract interface class SubjectRepository {
  Future<List<Subject>> getSubjects();
  Stream<List<Subject>> getResearchSubjectsStream(String keyWord);
}
