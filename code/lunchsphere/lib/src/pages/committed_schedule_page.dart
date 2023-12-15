import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/group_schedule_detail_card.dart';
import 'package:lunchsphere/src/components/lunch_link_header.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/providers/statistics_provider.dart';
import 'package:lunchsphere/src/services/api_service.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CommittedSchedulePage extends StatefulWidget {
  final GroupScheduleModel groupSchedule;
  const CommittedSchedulePage({
    super.key,
    required this.groupSchedule,
  });

  @override
  State<CommittedSchedulePage> createState() => _CommittedSchedulePageState();
}

class _CommittedSchedulePageState extends State<CommittedSchedulePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<StatisticsProvider>(context, listen: false).stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                const LunchLinkHeader(),
                const SizedBox(height: 40),
                const CommittedIndicatorWidget(),
                const SizedBox(height: 20),
                GroupScheduleDetailCard(groupSchedule: widget.groupSchedule),
                const SizedBox(height: 32),
                CustomButton(
                  color: StyleConsts.purpleLight,
                  width: double.infinity,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.rescheduleRequestRoute,
                      arguments: widget.groupSchedule,
                    );
                  },
                  child: Center(
                    child: Text(
                      "Request Reschedule",
                      style: StyleConsts.buttonText
                          .copyWith(color: StyleConsts.purpleDark),
                    ),
                  ),
                ),
                CustomButton(
                  color: StyleConsts.white.withAlpha(0),
                  onPressed: () {
                    // Navigator.popUntil(
                    //   context,
                    //   (route) => route.settings.name == Routes.homeRoute,
                    // );
                    int groupId = widget.groupSchedule.id;
                    updateGroupMembersLunch(groupId, provider.user!, false);
                    context.read<DataProvider>().reloadGroupSchedules();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Can't make it?",
                    style: StyleConsts.buttonText
                        .copyWith(color: StyleConsts.purplePrimary),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommittedIndicatorWidget extends StatelessWidget {
  const CommittedIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 264,
          // height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFF8DE295),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '🍻',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0C6215),
                  fontSize: 28,
                  fontFamily: 'SF Pro Text',
                ),
              ),
              SizedBox(width: 4),
              Text(
                ' You have committed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0C6215),
                  fontSize: 16,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
