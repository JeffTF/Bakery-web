part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoadingState extends LanguageState {}

class LanguageChangeSuccessState extends LanguageState {
  final String language;
  LanguageChangeSuccessState(this.language);
}
