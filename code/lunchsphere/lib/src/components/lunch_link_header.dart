import 'package:flutter/material.dart';
import 'package:lunchsphere/src/util/routes.dart';

import '../util/style_consts.dart';

class LunchLinkHeader extends StatelessWidget {
  const LunchLinkHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.groupSettings,
              );
            },
            child: const Icon(
              Icons.group,
              color: StyleConsts.greyDarker,
              size: 32,
            ),
          ),
          Image.asset(
            'assets/images/LunchSphereLogo_154x33.png',
            fit: BoxFit.cover,
            height: 32, // Adjust the size to fit your logo design
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.profileSettings,
              );
            },
            child: Image.asset(
              'assets/images/main.png',
              fit: BoxFit.cover,
              height: 32, // Adjust the size to fit your logo design
            ),
          ),
        ],
      ),
    );
  }
}
