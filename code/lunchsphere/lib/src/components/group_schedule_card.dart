import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/profile_picture_text_component.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/profile_model.dart';
import 'package:lunchsphere/src/util/routes.dart';
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
            ProfilePictureTextComponent(profile: p),
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
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.committedScheduleRoute,
              arguments: groupSchedule,
            );
          },
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
            Navigator.pushNamed(
              context,
              Routes.groupScheduleDetailRoute,
              arguments: groupSchedule,
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
