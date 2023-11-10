import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/group_schedule_detail_card.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

class GroupScheduleDetailPage extends StatelessWidget {
  final GroupScheduleModel groupSchedule;

  const GroupScheduleDetailPage({
    super.key,
    required this.groupSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return PageWidgetScrollable(
      title: "Schedule Details",
      canPop: true,
      child: Column(
        children: [
          GroupScheduleDetailCard(
            groupSchedule: groupSchedule,
            bottomWidget: buildActionButtons(context),
          ),
        ],
      ),
    );
  }

  Column buildActionButtons(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          width: double.infinity,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => CommittedSchedulePage(
                  groupSchedule: groupSchedule,
                ),
              ),
            );
          },
          color: StyleConsts.greenBackground,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
          child: Center(
            child: Text(
              "Accept",
              style: StyleConsts.buttonText
                  .copyWith(color: StyleConsts.greenPrimary),
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomButton(
          width: double.infinity,
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.rescheduleRequestRoute,
              arguments: groupSchedule,
            );
          },
          color: StyleConsts.purpleLighter,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
          child: Center(
            child: Text(
              "Request Reschedule",
              style: StyleConsts.buttonText
                  .copyWith(color: StyleConsts.purplePrimary),
            ),
          ),
        ),
      ],
    );
  }
}
