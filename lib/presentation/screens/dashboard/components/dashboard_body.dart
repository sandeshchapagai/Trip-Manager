import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/theme/bottom_navigation_bloc.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Center(
          child: state.bottomNavbarPages.isEmpty
              ? const SizedBox.shrink()
              : state.bottomNavbarPages[state.currentIndex],
        );
      },
    );
  }
}
