import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
import 'package:lunchsphere/src/pages/group_schedule_detail_page.dart';
import 'package:lunchsphere/src/pages/home_page.dart';
import 'package:lunchsphere/src/pages/reschedule_request_page.dart';

class Routes {
  static const String homeRoute = '/';
  static const String groupScheduleDetailRoute = '/group_schedule_detail';
  static const String committedScheduleRoute = '/committed_schedule';
  static const String rescheduleRequestRoute = '/reschedule_request';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return CupertinoPageRoute(builder: (_) => HomePage());
      case groupScheduleDetailRoute:
        final groupSchedule = settings.arguments as GroupScheduleModel;
        return CupertinoPageRoute(
          builder: (context) => GroupScheduleDetailPage(
            groupSchedule: groupSchedule,
          ),
        );
      case committedScheduleRoute:
        final groupSchedule = settings.arguments as GroupScheduleModel;
        return CupertinoPageRoute(
          builder: (context) => CommittedSchedulePage(
            groupSchedule: groupSchedule,
          ),
        );
      case rescheduleRequestRoute:
        final groupSchedule = settings.arguments as GroupScheduleModel;
        return CupertinoPageRoute(
          builder: (context) => RescheduleRequestPage(
            groupSchedule: groupSchedule,
          ),
        );
      default:
        return CupertinoPageRoute(builder: (_) => HomePage());
    }
  }
}
