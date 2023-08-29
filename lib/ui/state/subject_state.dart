import 'package:share_study_app/data/domain/subject.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';

part 'subject_state.g.dart';

@Riverpod(keepAlive: true)
class SubjectState extends _$SubjectState {
  @override
  Future<List<Subject>> build() async {
    return ref.watch(subjectRepositoryProvider).getSubjects();
  }
}
