import 'package:myanmar_political_studies/data/models/account.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class LoadedProfileState extends ProfileState {
  final Account account;

  LoadedProfileState(this.account);
}

class LogoutProfileState extends ProfileState {}
