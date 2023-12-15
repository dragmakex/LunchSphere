import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/profile_picture_text_component.dart';
import 'package:lunchsphere/src/models/user.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

import '../models/group_schedule_model.dart';

class GroupScheduleDetailCard extends StatelessWidget {
  final GroupScheduleModel groupSchedule;
  final Widget bottomWidget;

  const GroupScheduleDetailCard({
    super.key,
    required this.groupSchedule,
    this.bottomWidget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: StyleConsts.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(groupSchedule.groupName, style: StyleConsts.groupTitle),
          const SizedBox(height: 10.0),
          Text(groupSchedule.time, style: StyleConsts.bigTimeStyle),
          const SizedBox(height: 24),
          const Text("📍 Place", style: StyleConsts.groupSubHeader),
          const SizedBox(height: 10.0),
          Text(groupSchedule.place, style: StyleConsts.pageTitle),
          const SizedBox(height: 24),
          buildProfileGroup(
            "👥 Joining",
            groupSchedule.profilesJoining,
            "No one is joining yet",
          ),
          buildProfileGroup(
            "👥 Pending",
            groupSchedule.profilesPending,
            "No one is pending",
          ),
          bottomWidget,
        ],
      ),
    );
  }

  Column buildProfileGroup(
      String title, List<User> profiles, String emptyListMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: StyleConsts.groupSubHeader),
        const SizedBox(height: 10.0),
        if (profiles.isEmpty)
          Text(emptyListMessage, style: StyleConsts.textPrimary)
        else
          for (User p in profiles) ...[
            ProfilePictureTextComponent(profile: p),
            const SizedBox(height: 4),
          ],
        const SizedBox(height: 20),
      ],
    );
  }
}
