import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/components/profile_picture_text_component.dart';
import 'package:lunchsphere/src/components/time_picker_widget.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

class GroupMembersManager extends StatefulWidget {
  final GroupScheduleModel groupSchedule;

  const GroupMembersManager({
    super.key,
    required this.groupSchedule,
  });

  @override
  State<GroupMembersManager> createState() => _GroupMembersManagerState();
}

class _GroupMembersManagerState extends State<GroupMembersManager> {
  @override
  Widget build(BuildContext context) {
    return PageWidgetFixed(
      canPop: true,
      title: "Group Members",
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("👥 All members", style: StyleConsts.pageTitle),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.groupSchedule.members.length,
              itemBuilder: (context, index) {
                final item = widget.groupSchedule.members[index];
                return Dismissible(
                    key: Key(item.name),
                    onDismissed: (direction) {
                      setState(() {
                        widget.groupSchedule.members.removeAt(index);
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
                      color: StyleConsts.redPrimary,
                      child: const Icon(Icons.delete),
                    ),
                    // wrap all children with a container to add padding
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ProfilePictureTextComponent(
                        profile: item,
                      ),
                    ));
              },
            ),
            const SizedBox(height: 8),
            const Spacer(),
            CustomButton(
              color: StyleConsts.purplePrimary,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              width: double.infinity,
              onPressed: () {
                // BACKEND: INSERT LOGIC HERE
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  "Set new time",
                  style:
                      StyleConsts.buttonText.copyWith(color: StyleConsts.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
