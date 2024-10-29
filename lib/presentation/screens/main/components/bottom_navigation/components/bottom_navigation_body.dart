import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';
import 'package:trip_manager/presentation/screens/main/components/bottom_navigation/components/widgets/custom_navigation_bar_item.dart';

import '../../../../../../bloc/theme/bottom_navigation_bloc.dart';
import '../../../../../../core/app/constants/styles.dart';
import '../../../../../../core/services/di_injection/get_di_injection.dart';

class BottomNavigationBody extends StatelessWidget {
  const BottomNavigationBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.bottomNavbarItem.isEmpty
            ? const SizedBox.shrink()
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: context.bottomNavigationBarTheme.backgroundColor,
                ),
                child: BottomNavigationBar(
                  currentIndex: state.currentIndex,
                  onTap: (index) => bottomNavigationRepository
                      .bottomNavigationAction(context: context, index: index),
                  selectedLabelStyle: customTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: customTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  enableFeedback: true,
                  type: BottomNavigationBarType.fixed,
                  items: state.bottomNavbarItem
                      .map(
                        (e) => buildNavbarItem(
                            visibility: e.heading != null,
                            text: e.heading,
                            icon: e.image ?? "",
                            context: context),
                      )
                      .toList(),
                ),
              );
      },
    );
  }
}
