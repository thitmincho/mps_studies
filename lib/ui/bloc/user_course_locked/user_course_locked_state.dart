import 'package:myanmar_political_studies/data/models/course/CourseDetailResponse.dart';
import 'package:myanmar_political_studies/data/models/curriculum.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserCourseLockedState {}

class InitialUserCourseLockedState extends UserCourseLockedState {}

class LoadedUserCourseLockedState extends UserCourseLockedState {
  final CourseDetailResponse courseDetailResponse;

  LoadedUserCourseLockedState(this.courseDetailResponse);
}
