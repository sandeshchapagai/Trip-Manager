import 'package:flutter/material.dart';

class AppStaticModel {
  dynamic extraDescription, actualPrice, discountedPrice;
  String? heading,
      image,
      subHeading,
      primaryDescription,
      secondaryDescription,
      tertiaryDescription,
      quaternaryDescription,
      id,
      value;
  bool isRichText,
      isSvg,
      isCompleted,
      isExpansionTile,
      isAboveExpansionTile,
      isBelowExpansionTile,
      isFromServer,
      isActive,
      isFromDetails;
  int? backgroundColor, index;
  String? routeName;
  Widget? page;
  Icon? iconData;
  Color? color;
  List<AppStaticModel> list;
  AppStaticModel(
      {this.image,
      this.heading,
      this.isActive = false,
      this.isCompleted = false,
      this.isAboveExpansionTile = false,
      this.isFromServer = false,
      this.iconData,
      this.isExpansionTile = false,
      this.isBelowExpansionTile = false,
      this.list = const [],
      this.page,
      this.isSvg = true,
      this.isRichText = false,
      this.extraDescription,
      this.isFromDetails = false,
      this.primaryDescription,
      this.secondaryDescription,
      this.tertiaryDescription,
      this.quaternaryDescription,
      this.subHeading,
      this.color,
      this.backgroundColor,
      this.routeName,
      this.actualPrice,
      this.discountedPrice,
      this.id,
      this.value,
      this.index});

  AppStaticModel copyWith(
      {String? heading,
      String? subHeading,
      String? id,
      String? value,
      dynamic extraDescription}) {
    return AppStaticModel(
      heading: heading ?? this.heading,
      subHeading: subHeading ?? this.subHeading,
      id: id ?? this.id,
      value: value ?? this.value,
      extraDescription: extraDescription ?? this.extraDescription,
    );
  }
}
