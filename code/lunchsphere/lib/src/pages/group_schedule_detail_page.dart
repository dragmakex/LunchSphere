import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/profile_model.dart';
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
    // similar body to homepage
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
                buildCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCard(BuildContext context) {
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
          buildProfileGroup(
            "👥 Declined",
            groupSchedule.profilesDeclined,
            "No one has declined yet",
          ),
          CustomButton(
            width: double.infinity,
            onPressed: () {},
            color: StyleConsts.greenBackground,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
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
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
            child: Center(
              child: Text(
                "Request Reschedule",
                style: StyleConsts.buttonText
                    .copyWith(color: StyleConsts.purplePrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildProfileGroup(
      String title, List<ProfileModel> profiles, String emptyListMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("👥 Joining", style: StyleConsts.groupSubHeader),
        const SizedBox(height: 10.0),
        if (profiles.isEmpty)
          Text(emptyListMessage, style: StyleConsts.textPrimary)
        else
          for (ProfileModel p in groupSchedule.profilesJoining) ...[
            Row(
              children: [
                Image.asset(p.avatarUrl, width: 32, height: 32),
                const SizedBox(width: 8),
                Text(p.name, style: StyleConsts.textPrimary),
              ],
            ),
            const SizedBox(height: 4),
          ],
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildButtonColumn(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          width: double.infinity,
          onPressed: () {},
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
        CustomButton(
          color: StyleConsts.white,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => GroupScheduleDetailPage(
                  groupSchedule: groupSchedule,
                ),
              ),
            );
          },
          child: Text(
            "Options",
            style: StyleConsts.buttonText
                .copyWith(color: StyleConsts.purplePrimary),
          ),
        ),
      ],
    );
  }
}
