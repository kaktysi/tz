import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  void updateDuration(double duration) {
    emit(TimerRunning(duration));
  }
}
