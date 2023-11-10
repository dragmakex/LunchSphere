import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/pages/ab_chooser.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
import 'package:lunchsphere/src/pages/group_schedule_detail_page.dart';
import 'package:lunchsphere/src/pages/home_page_a.dart';
import 'package:lunchsphere/src/pages/home_page_b.dart';
import 'package:lunchsphere/src/pages/reschedule_request_page.dart';

class Routes {
  static const String homeRoute = '/';
  static const String groupScheduleDetailRoute = '/group_schedule_detail';
  static const String committedScheduleRoute = '/committed_schedule';
  static const String rescheduleRequestRoute = '/reschedule_request';
  static const String aTest = '/home_page_A';
  static const String bTest = '/home_page_B';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return CupertinoPageRoute(builder: (_) => const ABChooser());
      case aTest:
        return CupertinoPageRoute(builder: (_) => HomePageA());
      case bTest:
        return CupertinoPageRoute(builder: (_) => HomePageB());
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
        return CupertinoPageRoute(builder: (_) => const ABChooser());
    }
  }
}
