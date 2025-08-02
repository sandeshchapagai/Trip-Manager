import 'package:flutter/material.dart';
import 'package:trip_manager/core/routes/route_navigator.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';
import 'package:trip_manager/presentation/screens/friends/components/friends_body.dart';

import 'components/create_friends_group_body.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            RouteNavigator.navigate(context, const CreateFriendsGroupBody());
            print('Add button pressed');
          },
          backgroundColor: Colors.blue, // You can change the color here
          tooltip: 'Add new item',
          child: Icon(
            Icons.add,
            color: context.colors.white,
          ),
        ),
        body: const FriendsBody());
  }
}
