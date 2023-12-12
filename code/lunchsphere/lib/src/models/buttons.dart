import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';

class ExampleButton extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const ExampleButton({
    required this.onTap,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: child,
    );
  }
}

//swipe card to the right side
Widget swipeRightButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeRight(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: StyleConsts.greenConfirm,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.activeGreen.withOpacity(0.9),
            spreadRadius: -10,
            blurRadius: 20,
            offset: const Offset(0, 20), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.check,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//swipe card to the left side
Widget swipeLeftButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeLeft(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 17, 68),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF3868).withOpacity(0.9),
            spreadRadius: -10,
            blurRadius: 20,
            offset: const Offset(0, 20), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.close,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//unswipe card
Widget unswipeButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.unswipe(),
    child: Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: const Icon(
        Icons.rotate_left_rounded,
        color: CupertinoColors.systemGrey2,
        size: 40,
      ),
    ),
  );
}

/* class ProfileSettingsButton extends StatelessWidget {
  const ProfileSettingsButton(
      {super.key,
      required this.text,
      required this.toggle,
      required this.onPressed});

  final String text;
  final bool toggle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CupertinoButton(
          color: StyleConsts.white,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          onPressed: onPressed,
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
 */