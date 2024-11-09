import 'package:trip_manager/core/app/constants/icons.dart';
import 'package:trip_manager/core/app/constants/images.dart';
import 'package:trip_manager/data/models/app_static/app_static_model.dart';

class HomeRepository {
  var homeTabs = [
    AppStaticModel(heading: "Flight", image: kAirplaneIcon),
    AppStaticModel(heading: "Bus", image: kBusIcon),
    AppStaticModel(heading: "Taxi", image: kTaxiIcon),
    AppStaticModel(heading: "Flight", image: kBusIcon),
  ];
  var feedList = [
    AppStaticModel(
        heading: "Sandesh Chapagai",
        subHeading: "fds fsdf sd fsdfsf sfsdfdsf sfdsfsdf sfdfsdf sfdd",
        image: kLandScape),
    AppStaticModel(
        heading: "Ram Bahadur",
        subHeading: "fds fsdf sd fsdfsf sfsdfdsf sfdsfsdf sfdfsdf sfdd",
        image: kBackground),
    AppStaticModel(
        heading: "Gili gante",
        subHeading: "fds fsdf sd fsdfsf sfsdfdsf sfdsfsdf sfdfsdf sfdd",
        image: kLandScape),
  ];
}
