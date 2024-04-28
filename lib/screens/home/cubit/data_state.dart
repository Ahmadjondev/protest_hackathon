part of 'data_cubit.dart';

@freezed
class DataState with _$DataState {
  const factory DataState.loading() = _Loading;

  const factory DataState.loaded(
      {List<ContestModel>? contests,
      List<QuizModel>? quizzes,
      List<UniversityModel>? universities}) = Loaded;

  const factory DataState.error() = _Error;
}
