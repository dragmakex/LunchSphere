import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/group_settings_card.dart';
import 'package:lunchsphere/src/components/group_settings_detail_card.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/components/profile_picture_text_component.dart';
import 'package:lunchsphere/src/models/buttons.dart';
import 'package:lunchsphere/src/pages/committed_schedule_page.dart';
import 'package:lunchsphere/src/pages/group_members.dart';
import 'package:lunchsphere/src/pages/reschedule_default_time.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

import '../models/group_schedule_model.dart';

class GroupSettingsDetailPage extends StatefulWidget {
  final GroupScheduleModel groupSchedule;
  final Widget bottomWidget;

  const GroupSettingsDetailPage({
    super.key,
    required this.groupSchedule,
    this.bottomWidget = const SizedBox(),
  });
  @override
  _GroupSettingsState createState() => _GroupSettingsState();
}

class _GroupSettingsState extends State<GroupSettingsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return PageWidgetScrollable(
      title: "Group Details",
      canPop: true,
      child: Column(
        children: [
          GroupSettingsDetailCard(
            groupSchedule: widget.groupSchedule,
          ),
          const SizedBox(height: 15),
          const notificationsButton(),
          const SizedBox(height: 15),
          CustomButton(
            color: StyleConsts.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Manage Default Time",
                    style: StyleConsts.buttonText.copyWith(
                        color: StyleConsts.greyDarker,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: StyleConsts.greyDarker,
                  size: 20,
                ),
              ],
            ),
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
                      RescheduleGroupTime(
                    groupSchedule: widget.groupSchedule,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
          const Text("👥 All members", style: StyleConsts.pageTitle),
          const SizedBox(height: 15.0),
          // wrap the listview with a container to add padding and a border
          Container(
            decoration: BoxDecoration(
              color: StyleConsts.white,
              borderRadius: BorderRadius.circular(16),
              // add padding
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
              // IDK ABOUT THIS ONE
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.groupSchedule.members.length,
              itemBuilder: (context, index) {
                final item = widget.groupSchedule.members[index];
                return Dismissible(
                    key: Key(item.name),
                    // only allow swiping to the left
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        widget.groupSchedule.members.removeAt(index);
                        // BACKEND: INSERT LOGIC HERE
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${item.name} removed from group"),
                          action: SnackBarAction(
                            label: "Undo",
                            onPressed: () {
                              setState(() {
                                widget.groupSchedule.members
                                    .insert(index, item);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    background: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: StyleConsts.redPrimary,
                      ),
                      child: const Icon(Icons.delete, color: StyleConsts.white),
                    ),
                    // wrap all children with a container to add padding and have a border between each item, except the last one
                    // make it only take up 75% of the width so that the border doesn't go all the way to the left edge
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                index == widget.groupSchedule.members.length - 1
                                    ? Colors.transparent
                                    : StyleConsts.greyLighter,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: ProfilePictureTextComponent(
                        profile: item,
                      ),
                    ));
              },
            ),
          ),
          /* CustomButton(
            color: StyleConsts.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Manage Members",
                    style: StyleConsts.buttonText.copyWith(
                        color: StyleConsts.greyDarker,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: StyleConsts.greyDarker,
                  size: 20,
                ),
              ],
            ),
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
                      GroupMembersManager(
                    groupSchedule: groupSchedule,
                  ),
                ),
              );
            },
          ), */
        ],
      ),
    );
  }
}
