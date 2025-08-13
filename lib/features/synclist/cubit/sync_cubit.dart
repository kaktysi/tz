import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sync_state.dart';

class SyncCubit extends Cubit<SyncState> {
  SyncCubit() : super(SyncState());

  void updateIndex(int index) {
    emit(SyncState(selectedIndex: index));
  }
}
