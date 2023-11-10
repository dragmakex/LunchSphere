import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/profile_picture_text_component.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/profile_model.dart';
import 'package:lunchsphere/src/util/style_consts.dart';

class TinderScheduleBody extends StatelessWidget {
  final GroupScheduleModel groupSchedule;

  const TinderScheduleBody({Key? key, required this.groupSchedule})
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
          const Text("Place", style: StyleConsts.groupSubHeader),
          const SizedBox(height: 24),
          const Text("Invited", style: StyleConsts.groupSubHeader),
        ],
      ),
    );
  }
}
