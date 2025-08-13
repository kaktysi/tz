import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/theme.dart';
import '../../features.dart';

class TimerContent extends StatefulWidget {
  const TimerContent({super.key});

  @override
  State<TimerContent> createState() => _TimerContentState();
}

class _TimerContentState extends State<TimerContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final int _duration = 10;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(
          vsync: this,
          duration: Duration(seconds: _duration),
        )..addListener(() {
          final newDuration =
              (_duration - (_duration * _animationController.value)).ceil();
          context.read<TimerCubit>().updateDuration(newDuration.toDouble());
        });
    _animationController.forward();
  }

  void _restartTimer() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Timer')),
        body: Center(
          child: Column(
            spacing: AppDimens.SPACING_32,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: AppDimens.CIRCULAR_INDICATOR_SIZE,
                        height: AppDimens.CIRCULAR_INDICATOR_SIZE,
                        child: CircularProgressIndicator(
                          value: 1.0 - _animationController.value,
                          strokeWidth: AppDimens.CIRCULAR_INDICATOR_WIDTH,
                          backgroundColor: AppColors.grey2,
                          color: AppColors.deepPurple,
                        ),
                      ),
                      Text(
                        '${(_duration - (_duration * _animationController.value)).ceil()}',
                        style: TextStyle(
                          fontSize: AppDimens.FONT_SIZE_72,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
              ElevatedButton(
                onPressed: _restartTimer,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimens.BORDER_RADIUS_20,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.PADDING_40,
                    vertical: AppDimens.PADDING_16,
                  ),
                ),
                child: Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
