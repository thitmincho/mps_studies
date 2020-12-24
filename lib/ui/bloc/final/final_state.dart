import 'package:myanmar_political_studies/data/models/FinalResponse.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FinalState {}

class InitialFinalState extends FinalState {}

class LoadedFinalState extends FinalState {
  final FinalResponse finalResponse;

  LoadedFinalState(this.finalResponse);
}

class ErrorFinalState extends FinalState {}
