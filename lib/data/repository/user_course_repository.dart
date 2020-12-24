import 'package:myanmar_political_studies/data/models/course/CourseDetailResponse.dart';
import 'package:myanmar_political_studies/data/models/curriculum.dart';
import 'package:myanmar_political_studies/data/models/user_course.dart';
import 'package:myanmar_political_studies/data/network/api_provider.dart';

abstract class UserCourseRepository {
  Future<UserCourseResponse> getUserCourses();

  Future<CurriculumResponse> getCourseCurriculum(int id);

  Future<CourseDetailResponse> getCourse(int courseId);
}

class UserCourseRepositoryImpl extends UserCourseRepository {
  final UserApiProvider _apiProvider;

  UserCourseRepositoryImpl(this._apiProvider);

  @override
  Future<UserCourseResponse> getUserCourses() {
    return _apiProvider.getUserCourses();
  }

  @override
  Future<CurriculumResponse> getCourseCurriculum(int id) {
    return _apiProvider.getCourseCurriculum(id);
  }

  @override
  Future<CourseDetailResponse> getCourse(int courseId) {
    return _apiProvider.getCourse(courseId);
  }
}
