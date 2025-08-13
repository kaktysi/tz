import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/core/app_constants.dart';
import '../../../theme/theme.dart';
import '../cubit/sync_cubit.dart';

class SyncContent extends StatelessWidget {
  const SyncContent({super.key});

  final List<Color> _colors = AppConstants.colorList;
  final List<String> _colorNames = AppConstants.colorNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SyncList')),
      body: BlocBuilder<SyncCubit, SyncState>(
        builder: (context, state) {
          return Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  color: _colors[state.selectedIndex],
                  child: Center(
                    child: Text(
                      _colorNames[state.selectedIndex],
                      style: TextStyle(
                        fontSize: AppDimens.FONT_SIZE_72,
                        color: _getTextColor(state.selectedIndex),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: _colors.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: state.selectedIndex == index
                            ? Border.all(
                                color: AppColors.black,
                                width: AppDimens.BORDER_WIDTH_2,
                              )
                            : null,
                      ),
                      child: ListTile(
                        tileColor: _colors[index],
                        title: Text(
                          _colorNames[index],
                          style: TextStyle(color: _getTextColor(index)),
                        ),
                        onTap: () {
                          context.read<SyncCubit>().updateIndex(index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Color _getTextColor(int index) {
    return index % 10 < 4 || index == _colors.length - 1
        ? AppColors.black
        : AppColors.white;
  }
}
