import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:lunchsphere/src/components/tinder_schedule_body.dart';
import 'package:lunchsphere/src/models/buttons.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/services/api_service.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:lunchsphere/src/components/lunch_link_header.dart';

class HomePageB extends StatelessWidget {
  HomePageB({super.key});

  final ApiService apiService = ApiService();
  final AppinioSwiperController controller = AppinioSwiperController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const LunchLinkHeader(),
              const SizedBox(height: 30),
              SizedBox(
                // make height flexible
                height: MediaQuery.of(context).size.height * 0.6,
                child: AppinioSwiper(
                  controller: controller,
                  cardsCount: provider.groupSchedules.length,
                  swipeOptions: const AppinioSwipeOptions.all(),
                  // on right swipe: route to committed schedule
                  onSwipe: (index, direction) {
                    if (direction == AppinioSwiperDirection.right) {
                      Navigator.pushNamed(
                        context,
                        Routes.committedScheduleRoute,
                        arguments: provider.groupSchedules[index - 1],
                      );
                    }
                  },
                  cardsBuilder: (context, index) {
                    return TinderScheduleBody(
                      groupSchedule: provider.groupSchedules[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 80,
                  ),
                  swipeLeftButton(controller),
                  const SizedBox(
                    width: 20,
                  ),
                  swipeRightButton(controller),
                  const SizedBox(
                    width: 20,
                  ),
                  unswipeButton(controller),
                ],
              ),
              const Spacer(),
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
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
