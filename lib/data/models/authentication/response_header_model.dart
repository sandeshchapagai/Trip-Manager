class ResponseHeaderModel {
  String? xPoweredBy;
  String? restroxtoken;

  ResponseHeaderModel({
    this.xPoweredBy,
    this.restroxtoken,
  });

  factory ResponseHeaderModel.fromJson(Map<String, dynamic> json) =>
      ResponseHeaderModel(
        xPoweredBy: json["x-powered-by"],
        restroxtoken: json["restroxtoken"],
      );
}
