import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/group_schedule_card.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/models/buttons.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    return PageWidgetScrollable(
      title: "Profile Settings",
      canPop: true,
      child: Column(
        children: [
          Row(children: [
            Image.asset(
              provider.user!.profileImageUrl,
              fit: BoxFit.cover,
              height: 80, // Adjust the size to fit your logo design
            ),
            const SizedBox(width: 40),
            // create stacked Username and Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.user!.name,
                  // make it bold
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  provider.user!.email,
                  style: StyleConsts.textSecondary,
                ),
              ],
            ),
          ]),
          const SizedBox(height: 40),
          // create a button to navigate to the group settings page
          const notificationsButton(),
          /* CustomButton(
            color: StyleConsts.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications",
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
              Navigator.pushNamed(
                context,
                Routes.groupSettings,
              );
            },
          ), */
          const SizedBox(height: 15),
          CustomButton(
            color: StyleConsts.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Change Password",
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
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          CustomButton(
            color: StyleConsts.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Privacy Policy",
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
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          CustomButton(
            color: StyleConsts.white,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Terms of Service",
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
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          CustomButton(
            color: StyleConsts.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Acknowledgements",
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
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          CustomButton(
            color: StyleConsts.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Log Out",
                    style: StyleConsts.buttonText.copyWith(
                        color: StyleConsts.greyDarker,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                const Icon(
                  Icons.logout,
                  color: StyleConsts.greyDarker,
                  size: 20,
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
