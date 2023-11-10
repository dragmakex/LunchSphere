import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/group_schedule_detail_card.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

class CommittedSchedulePage extends StatelessWidget {
  final GroupScheduleModel groupSchedule;
  const CommittedSchedulePage({
    super.key,
    required this.groupSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Schedule Details", style: StyleConsts.pageTitle),
                ),
                const SizedBox(height: 32),
                GroupScheduleDetailCard(groupSchedule: groupSchedule),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      color: StyleConsts.white.withAlpha(0),
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                          (route) => route.settings.name == Routes.homeRoute,
                        );
                      },
                      child: Text(
                        "Can't make it?",
                        style: StyleConsts.buttonText
                            .copyWith(color: StyleConsts.purplePrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
