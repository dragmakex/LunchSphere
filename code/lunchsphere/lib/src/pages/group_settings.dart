import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/group_settings_card.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/providers/statistics_provider.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class GroupSettings extends StatelessWidget {
  const GroupSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    print("rebuild");
    return PageWidgetScrollable(
      title: "Manage Groups",
      canPop: true,
      child: Column(
        children: [
          for (GroupScheduleModel groupSchedule in provider.groupSchedules) ...[
            GroupSettingsCard(
              groupSchedule: groupSchedule,
              id: groupSchedule.id,
            ),
            const SizedBox(height: 10),
          ],
          CustomButton(
            color: StyleConsts.backgroundPrimary,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            width: double.infinity,
            onPressed: () {},
            child: Center(
              child: Text(
                "Enter Group Code",
                style: StyleConsts.buttonText.copyWith(
                    color: StyleConsts.purplePrimary,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            color: StyleConsts.purplePrimary,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            width: double.infinity,
            onPressed: () {},
            child: Center(
              child: Text(
                "Create New Group",
                style: StyleConsts.buttonText.copyWith(
                    color: StyleConsts.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
