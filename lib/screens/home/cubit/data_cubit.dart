import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protest/common/local_data.dart';
import 'package:protest/models/contest_model.dart';
import 'package:protest/models/quiz_model.dart';

import '../../../models/university_model.dart';

part 'data_state.dart';

part 'data_cubit.freezed.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(const DataState.loading());

  getData() async {
    emit(DataState.loading());
    Future.delayed(Duration(milliseconds: 1500));

    emit(DataState.loaded(contests: contests,quizzes: quizData,universities: univers));
  }
}
