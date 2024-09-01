class AppStaticImageModel {
  final String? imageOf, title;
  final String? serverImage;
  final bool isFromUpdate;
  final bool isMandatory;

  AppStaticImageModel(
      {this.imageOf,
      this.serverImage,
      this.isFromUpdate = false,
      this.isMandatory = false,
      this.title});
}
