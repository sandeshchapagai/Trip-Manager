import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/colors.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/utils/responsive.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';
import 'package:trip_manager/presentation/widgets/custom_image_asset_widget.dart';
import 'package:trip_manager/presentation/widgets/custom_search_textfield_widget.dart';
import 'package:trip_manager/presentation/widgets/custom_svg_widget.dart';

import '../../../../../../core/app/constants/font_size.dart';
import '../../../../../../core/app/constants/icons.dart';
import '../../../../../../core/app/constants/images.dart';
import '../../../../../../core/app/constants/styles.dart';
import '../../../../../../core/services/di_injection/get_di_injection.dart';
import '../../../../../widgets/custom_rating_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colors.primary
          // image: DecorationImage(
          //   image: AssetImage(kBackground),
          //   fit: BoxFit.cover,
          // ),
          ),
      child: Column(
        children: [
          kVSizedBox8,
          Responsive(
            context: context,
            child: CustomSearchTextFormWidget(
              readOnly: true,
              onChanged: () {},
              hintText: "Search Place ",
            ),
          ),
          kVSizedBox5,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: appWidth(context),
              child: Responsive(
                context: context,
                child: Column(
                  children: [
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          crossAxisSpacing: 15.0, // Space between columns
                          mainAxisSpacing: 30.0, // Space between rows
                          childAspectRatio: 1.5, // Aspect ratio of the cards
                        ),
                        itemCount: homeRepository.homeTabs.length,
                        itemBuilder: (context, index) {
                          var model = homeRepository.homeTabs[index];
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.kSTROKE!)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CustomSvgWidget(
                                      icon: model.image ?? "",
                                      color: context.colors.primary,
                                      height: 30,
                                    ),
                                    kVSizedBox0,
                                    CustomText(
                                      text: model.heading ?? "",
                                      fontSize: FontSize.kS12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    kVSizedBox1,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "Personalized",
                              fontWeight: FontWeight.w600,
                              fontSize: FontSize.kS16,
                            ),
                            kHSizedBox1,
                            CustomText(
                              decorationColor: context.colors.green,
                              color: context.colors.green,
                              text: "trips",
                              fontWeight: FontWeight.w600,
                              fontSize: FontSize.kS16,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const CustomText(
                              text: "View All",
                              fontWeight: FontWeight.w500,
                            ),
                            CustomSvgWidget(icon: kChevronRightIcon)
                          ],
                        )
                      ],
                    ),
                    kVSizedBox1,
                    SizedBox(
                      height: appHeight(context) * 0.25,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.kSTROKE!)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                  ),
                                  child: CustomImageAssetWidget(
                                      fit: BoxFit.fitWidth, image: kLandScape),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomRatingWidget(rating: "5.0"),
                                      kVSizedBox0,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "South india tour",
                                            fontWeight: FontWeight.w400,
                                          ),
                                          CustomText(
                                            text: "\$100",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            kHSizedBox2,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
