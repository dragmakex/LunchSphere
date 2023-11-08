import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:lunchsphere/src/components/tinder_schedule_body.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/services/api_service.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomePageB extends StatelessWidget {
  HomePageB({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                buildHeader(),
                const SizedBox(height: 32),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: AppinioSwiper(
                    cardsCount: provider.groupSchedules.length,
                    // on right swipe: route to committed schedule
                    onSwipe: (index, direction) {
                      if (direction == AppinioSwiperDirection.right) {
                        Navigator.pushNamed(
                          context,
                          Routes.committedScheduleRoute,
                          arguments: provider.groupSchedules[index],
                        );
                      }
                    },
                    cardsBuilder: (context, index) {
                      return GroupScheduleBody(
                        groupSchedule: provider.groupSchedules[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  color: StyleConsts.purplePrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  width: double.infinity,
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "Create Custom Lunchtime",
                      style: StyleConsts.buttonText
                          .copyWith(color: StyleConsts.white),
                    ),
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.account_circle,
            color: StyleConsts.greyDarker,
            size: 32,
          ),
          Image.asset(
            'assets/images/LunchSphereLogo_154x33.png',
            fit: BoxFit.cover,
            height: 32, // Adjust the size to fit your logo design
          ),
          Image.asset(
            'assets/images/avatar1.png',
            fit: BoxFit.cover,
            height: 32, // Adjust the size to fit your logo design
          ),
        ],
      ),
    );
  }
}
