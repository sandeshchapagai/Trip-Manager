import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_manager/bloc/theme/bottom_navigation_bloc.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

import '../../../core/utils/responsive.dart';
import '../../widgets/custom_appbar_widget.dart';
import '../main/components/bottom_navigation/bottom_navigation_screen.dart';
import 'components/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: ApplicationAppBar.customAppBarWidget(
            context: context,
            centerTitle: false,
            isMainBaseAppBar: true,
            textStyle: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          body: Responsive(
              context: context,
              mblBottom: 0,
              tabBottom: 0,
              child: const DashboardBody()),
          bottomNavigationBar: const BottomNavigationScreen(),
        );
      },
    );
    ;
  }
}
