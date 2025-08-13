import 'package:flutter/material.dart';
import 'package:tz/features/features.dart';
import 'package:tz/theme/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(children: [TimerScreen(), SyncScreen()]),
        bottomNavigationBar: TabBar(
          tabs: const [
            Tab(icon: Icon(Icons.timer), text: 'Timer'),
            Tab(icon: Icon(Icons.sync), text: 'SyncList'),
          ],
          labelColor: AppColors.deepPurple,
          unselectedLabelColor: AppColors.grey,
        ),
      ),
    );
  }
}
