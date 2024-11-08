import 'package:trip_manager/core/app/constants/icons.dart';
import 'package:trip_manager/data/models/app_static/app_static_model.dart';

class HomeRepository {
  var homeTabs = [
    AppStaticModel(heading: "Flight", image: kAirplaneIcon),
    AppStaticModel(heading: "Bus", image: kBusIcon),
    AppStaticModel(heading: "Taxi", image: kTaxiIcon),
    AppStaticModel(heading: "Flight", image: kBusIcon),
  ];
}
