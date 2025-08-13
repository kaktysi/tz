import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../timer.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: TimerContent(),
    );
  }
}
