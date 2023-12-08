import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/profile_picture_text_component.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/profile_model.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
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
          const Text("📍 Place", style: StyleConsts.groupSubHeader),
          const SizedBox(height: 8.0),
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
          const SizedBox(height: 24),
          buildButtonRow(context),
        ],
      ),
    );
  }

  Column buildProfileGroup(
      String title, List<ProfileModel> profiles, String emptyListMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: StyleConsts.groupSubHeader),
        const SizedBox(height: 10.0),
        if (profiles.isEmpty)
          Text(emptyListMessage, style: StyleConsts.textPrimary)
        else
          for (ProfileModel p in profiles) ...[
            ProfilePictureTextComponent(profile: p),
            const SizedBox(height: 4),
          ],
        const SizedBox(height: 17),
      ],
    );
  }

  Widget buildButtonRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: Curves.ease));
                    return SlideTransition(
                        position: animation.drive(tween), child: child);
                  },
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      CommittedSchedulePage(
                    groupSchedule: groupSchedule,
                  ),
                ),
              );
            },
            color: StyleConsts.greenBackground,
            child: Center(
              child: Text(
                "Accept",
                style: StyleConsts.buttonText
                    .copyWith(color: StyleConsts.greenPrimary),
              ),
            ),
          ),
        ),
        // const SizedBox(width: 20),
        // Expanded(
        //   child: CustomButton(
        //     color: StyleConsts.purpleLighter,
        //     onPressed: () {
        //       Navigator.pushNamed(
        //         context,
        //         Routes.groupScheduleDetailRoute,
        //         arguments: groupSchedule,
        //       );
        //     },
        //     child: Center(
        //       child: Text(
        //         "Details",
        //         style: StyleConsts.buttonText
        //             .copyWith(color: StyleConsts.purpleDark),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
