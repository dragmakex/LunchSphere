import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/group_schedule_detail_card.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
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
    print("Why this not working???");

    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: StyleConsts.blackPrimary,
                        size: 24,
                      ),
                    ),
                    const Text("Schedule Details",
                        style: StyleConsts.pageTitle),
                  ],
                ),
                const SizedBox(height: 20),
                GroupScheduleDetailCard(
                  groupSchedule: groupSchedule,
                  bottomWidget: buildActionButtons(context),
                ),
              ],
            ),
          ),
        ),
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
          onPressed: () {},
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
