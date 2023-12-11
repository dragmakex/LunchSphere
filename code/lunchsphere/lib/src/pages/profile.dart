import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/group_schedule_card.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/services/notificatino_services.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                // have the children at the start and end of the row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Profile Settings",
                      style: StyleConsts.pageTitle, textAlign: TextAlign.left),
                  //const SizedBox(width: 80),
                  // create a "back" button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: StyleConsts.greyDarker,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(children: [
                Image.asset(
                  'assets/images/main.png',
                  fit: BoxFit.cover,
                  height: 80, // Adjust the size to fit your logo design
                ),
                const SizedBox(width: 40),
                // create stacked Username and Email
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name Last Name",
                      // make it bold
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "youremail@gmail.com",
                      style: StyleConsts.textSecondary,
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 40),
              // create a button to navigate to the group settings page
              const ProfileSettingsButton(
                text: "Notifications",
                toggle: true,
              ),
              const ProfileSettingsButton(
                text: "Change Password",
                toggle: false,
              ),
              const ProfileSettingsButton(
                text: "Privacy Policy",
                toggle: false,
              ),
              const ProfileSettingsButton(
                text: "Terms of Service",
                toggle: false,
              ),
              const ProfileSettingsButton(
                text: "Acknowledgements",
                toggle: false,
              ),
              const ProfileSettingsButton(
                text: "Log Out",
                toggle: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// define a button that will be used to navigate the profile settings page multiple times, it accepts three parameters: Navigator, text, and toggle
class ProfileSettingsButton extends StatelessWidget {
  const ProfileSettingsButton(
      {super.key, required this.text, required this.toggle});

  final String text;
  final bool toggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CupertinoButton(
          color: StyleConsts.white,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          onPressed: () {
            if (!toggle) {}
            Navigator.pushNamed(
              context,
              Routes.groupSettings,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: StyleConsts.buttonText.copyWith(
                      color: StyleConsts.greyDarker,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              // if text == "Notifications" then show the toggle switch
              // if text == "Log Out" then show the log out button
              if (text == "Notifications")
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: StyleConsts.purplePrimary,
                )
              else if (text == "Log Out")
                const Icon(
                  Icons.logout,
                  color: StyleConsts.greyDarker,
                  size: 20,
                )
              else
                const Icon(
                  Icons.arrow_forward_ios,
                  color: StyleConsts.greyDarker,
                  size: 20,
                ),
            ],
          ),
        ));
  }
}
