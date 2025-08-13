import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../synclist.dart';

class SyncScreen extends StatelessWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SyncCubit(), child: SyncContent());
  }
}
