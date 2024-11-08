import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/app/constants/styles.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

class CustomRatingWidget extends StatefulWidget {
  final String? rating;
  const CustomRatingWidget({super.key, this.rating});

  @override
  State<CustomRatingWidget> createState() => _CustomRatingWidgetState();
}

class _CustomRatingWidgetState extends State<CustomRatingWidget> {
  var currentRating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          itemSize: 15,
          initialRating: currentRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: context.colors.black,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              currentRating = rating;
            });
          },
        ),
        kHSizedBox0,
        CustomText(
          text: widget.rating ?? "",
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}
