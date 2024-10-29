import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/utils/responsive.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';
import 'package:trip_manager/presentation/widgets/custom_search_textfield_widget.dart';

import '../../../../../../core/app/constants/images.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(kBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          kVSizedBox8,
          Responsive(
            context: context,
            child: CustomSearchTextFormWidget(
              onChanged: () {},
              hintText: "Search Place ",
            ),
          ),
          kVSizedBox9,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: appWidth(context),
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns
                        crossAxisSpacing: 15.0, // Space between columns
                        mainAxisSpacing: 5.0, // Space between rows
                        childAspectRatio: 1.5, // Aspect ratio of the cards
                      ),
                      padding: EdgeInsets.all(15.0),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "fv",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
