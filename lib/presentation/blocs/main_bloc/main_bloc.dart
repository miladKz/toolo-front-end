import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {});
    on<AccountingEvent>((event, emit) async{
      emit(MainLoading());
      await Future.delayed(const Duration(seconds: 2), () {
        emit(AccountingSuccess());
      });
    });
  }
}
