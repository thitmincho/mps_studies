import 'package:inject/inject.dart';
import 'package:myanmar_political_studies/data/models/LessonResponse.dart';
import 'package:myanmar_political_studies/data/models/QuizResponse.dart';
import 'package:myanmar_political_studies/data/network/api_provider.dart';

abstract class LessonRepository {
  Future<LessonResponse> getLesson(int courseId, int lessonId);

  Future<QuizResponse> getQuiz(int courseId, int lessonId);

  Future completeLesson(int courseId, int lessonId);
}

@provide
class LessonRepositoryImpl extends LessonRepository {
  final UserApiProvider _userApiProvider;

  LessonRepositoryImpl(this._userApiProvider);

  @override
  Future<LessonResponse> getLesson(int courseId, int lessonId) {
    return _userApiProvider.getLesson(courseId, lessonId);
  }

  @override
  Future completeLesson(int courseId, int lessonId) async {
    await _userApiProvider.completeLesson(courseId, lessonId);
    return;
  }

  @override
  Future<QuizResponse> getQuiz(int courseId, int lessonId) async {
    return _userApiProvider.getQuiz(courseId, lessonId);
  }
}
