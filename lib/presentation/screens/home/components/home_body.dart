import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/colors.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/utils/responsive.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';
import 'package:trip_manager/presentation/screens/home/components/widgets/custom_home_feed_widget.dart';
import 'package:trip_manager/presentation/screens/home/components/widgets/custom_info_widget.dart';
import 'package:trip_manager/presentation/widgets/custom_image_asset_widget.dart';
import 'package:trip_manager/presentation/widgets/custom_search_textfield_widget.dart';
import 'package:trip_manager/presentation/widgets/custom_svg_widget.dart';

import '../../../../../../core/app/constants/font_size.dart';
import '../../../../../../core/app/constants/images.dart';
import '../../../../../../core/app/constants/styles.dart';
import '../../../../../../core/services/di_injection/get_di_injection.dart';
import '../../../widgets/custom_rating_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colors.primary),
      child: ListView(
        children: [
          kVSizedBox3,
          Responsive(
            context: context,
            child: CustomSearchTextFormWidget(
              readOnly: true,
              onChanged: () {},
              hintText: "Search Place ",
            ),
          ),
          kVSizedBox3,
          Container(
            decoration: BoxDecoration(
                color: context.colors.primaryBackground,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            width: appWidth(context),
            child: Responsive(
              context: context,
              child: Column(
                children: [
                  kVSizedBox2,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 30.0,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: homeRepository.homeTabs.length,
                      itemBuilder: (context, index) {
                        var model = homeRepository.homeTabs[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: context.colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.kSTROKE)),
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
                  kVSizedBox2,
                  const CustomInfoWidget(
                      firstText: 'Personalized',
                      secondText: 'trips',
                      trialingText: "View All"),
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
                              color: context.colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.kSTROKE)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                  kVSizedBox2,
                  const CustomInfoWidget(
                      firstText: 'Stories by',
                      secondText: 'travellers',
                      trialingText: "View All"),
                  kVSizedBox1,
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var model = homeRepository.feedList[index];
                        return CustomHomeFeedWidget(
                          image: model.image ?? "",
                          description: model.subHeading ?? "",
                          name: model.heading ?? "",
                        );
                      },
                      separatorBuilder: (index, context) => kVSizedBox2,
                      itemCount: homeRepository.feedList.length)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
