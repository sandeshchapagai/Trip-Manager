import '../enums/enums.dart';

class FlavorConfig {
  static FlavorConfig shared = FlavorConfig.create();
  String baseUrl = "";
  Flavor flavor;

  FlavorConfig(this.baseUrl, this.flavor);

  factory FlavorConfig.create({
    String baseUrl = "",
    Flavor flavor = Flavor.dev,
  }) {
    return shared = FlavorConfig(baseUrl, flavor);
  }
}
