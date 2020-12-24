import 'package:myanmar_political_studies/data/models/LessonResponse.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TextLessonState {}

class InitialTextLessonState extends TextLessonState {}

class LoadedTextLessonState extends TextLessonState {
  final LessonResponse lessonResponse;

  LoadedTextLessonState(this.lessonResponse);
}
