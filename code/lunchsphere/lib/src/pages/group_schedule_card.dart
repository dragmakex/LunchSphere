import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/profile_model.dart';
import 'package:lunchsphere/src/pages/group_schedule_detail_page.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

class GroupScheduleCard extends StatelessWidget {
  final GroupScheduleModel groupSchedule;

  const GroupScheduleCard({Key? key, required this.groupSchedule})
      : super(key: key);

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
          const Text("👥 Joining", style: StyleConsts.groupSubHeader),
          const SizedBox(height: 10.0),
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
          const SizedBox(height: 24),
          buildButtonRow(context),
        ],
      ),
    );
  }

  Row buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          onPressed: () {},
          color: StyleConsts.greenBackground,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
          child: Text(
            "Accept",
            style: StyleConsts.buttonText
                .copyWith(color: StyleConsts.greenPrimary),
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
