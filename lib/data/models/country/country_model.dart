import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

class CountryModel {
  int? id;
  String? name;
  String? isoAlpha2;
  String? isoAlpha3;
  int? isoNumeric;
  Currency? currency;
  String? flag;

  CountryModel(
      {this.id,
      this.name,
      this.isoAlpha2,
      this.isoAlpha3,
      this.isoNumeric,
      this.currency,
      this.flag});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    isoAlpha2 = json["isoAlpha2"];
    isoAlpha3 = json["isoAlpha3"];
    isoNumeric = json["isoNumeric"];
    currency =
        json["currency"] == null ? null : Currency.fromJson(json["currency"]);
    flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["isoAlpha2"] = isoAlpha2;
    data["isoAlpha3"] = isoAlpha3;
    data["isoNumeric"] = isoNumeric;
    if (currency != null) {
      data["currency"] = currency?.toJson();
    }
    data["flag"] = flag;
    return data;
  }
}

class Currency {
  String? code;
  String? name;
  String? symbol;

  Currency({this.code, this.name, this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    name = json["name"];
    symbol = json["symbol"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["name"] = name;
    data["symbol"] = symbol;
    return data;
  }
}
