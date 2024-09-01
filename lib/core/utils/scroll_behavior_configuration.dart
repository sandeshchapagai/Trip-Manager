import 'package:flutter/cupertino.dart';

class CustomScrollPhysics extends ClampingScrollPhysics {
  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    var tolerance = toleranceFor(position);
    if (velocity.abs() >= tolerance.velocity || position.outOfRange) {
      return BouncingScrollSimulation(
        spring: spring,
        position: position.pixels,
        velocity: velocity,
        leadingExtent: position.minScrollExtent,
        trailingExtent: position.maxScrollExtent,
        tolerance: tolerance,
      );
    }
    return null;
  }
}

class ScrollBehaviorConfiguration extends CupertinoScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return CustomScrollPhysics();
  }
}
