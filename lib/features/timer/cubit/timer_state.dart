part of 'timer_cubit.dart';

@immutable
sealed class TimerState {
  const TimerState();
}

final class TimerInitial extends TimerState {
  final double duration;
  const TimerInitial({this.duration = 10});
}

final class TimerRunning extends TimerState {
  final double duration;
  const TimerRunning(this.duration);
}
