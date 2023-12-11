import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/pages/ab_chooser.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
import 'package:lunchsphere/src/pages/group_schedule_detail_page.dart';
import 'package:lunchsphere/src/pages/group_settings.dart';
import 'package:lunchsphere/src/pages/home_page_a.dart';
import 'package:lunchsphere/src/pages/home_page_b.dart';
import 'package:lunchsphere/src/pages/profile.dart';
import 'package:lunchsphere/src/pages/reschedule_request_page.dart';
import 'package:lunchsphere/src/pages/statistics_page.dart';

class Routes {
  static const String homeRoute = '/';
  static const String groupScheduleDetailRoute = '/group_schedule_detail';
  static const String committedScheduleRoute = '/committed_schedule';
  static const String rescheduleRequestRoute = '/reschedule_request';
  static const String aTest = '/home_page_A';
  static const String bTest = '/home_page_B';
  static const String statistics = '/statistics';
  static const String groupSettings = '/group_settings';
  static const String profileSettings = '/profile_settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return CupertinoPageRoute(builder: (_) => const ABChooser());
      case aTest:
        return CupertinoPageRoute(builder: (_) => HomePageA());
      case bTest:
        return CupertinoPageRoute(builder: (_) => HomePageB());
      case statistics:
        return CupertinoPageRoute(builder: (_) => const StatisticsPage());
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
      case groupSettings:
        return CupertinoPageRoute(builder: (_) => const GroupSettings());
      case profileSettings:
        return CupertinoPageRoute(builder: (_) => const ProfileSettings());
      default:
        return CupertinoPageRoute(builder: (_) => const ABChooser());
    }
  }
}
