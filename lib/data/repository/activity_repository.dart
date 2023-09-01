import 'package:share_study_app/data/domain/activity.dart';

abstract interface class ActivityRepository {
  Future<Activity> get(String id);
}
