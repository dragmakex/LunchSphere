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
import 'package:lunchsphere/src/providers/statistics_provider.dart';

class HomePageB extends StatefulWidget {
  HomePageB({super.key});

  @override
  State<HomePageB> createState() => _HomePageBState();
}

class _HomePageBState extends State<HomePageB> {
  @override
  void initState() {
    super.initState();
    Provider.of<StatisticsProvider>(context, listen: false).startCardTimer();
  }

  final AppinioSwiperController controller = AppinioSwiperController();
  bool displaySwiper = true;
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
              const SizedBox(height: 20),
              if (displaySwiper)
                SizedBox(
                  // make height flexible
                  height: MediaQuery.of(context).size.height * 0.64,
                  child: AppinioSwiper(
                    controller: controller,
                    unlimitedUnswipe: true,
                    cardsCount: provider.groupSchedules.length,
                    swipeOptions: const AppinioSwipeOptions.all(),
                    // on right swipe: route to committed schedule
                    onSwipe: (index, direction) {
                      Provider.of<StatisticsProvider>(context, listen: false)
                          .stopCardTimer(index - 1);
                      if (direction == AppinioSwiperDirection.right) {
                        Navigator.pushNamed(
                          context,
                          Routes.committedScheduleRoute,
                          arguments: provider.groupSchedules[index - 1],
                        );
                      } else {
                        Provider.of<StatisticsProvider>(context, listen: false)
                            .startCardTimer();
                      }
                    },
                    // define onEnd a collapsing this SizedBox
                    onEnd: () {
                      setState(() {
                        Provider.of<StatisticsProvider>(context, listen: false)
                            .stopCardTimer(provider.groupSchedules.length - 1);
                        displaySwiper = false;
                      });
                    },
                    cardsBuilder: (context, index) {
                      return TinderScheduleBody(
                        groupSchedule: provider.groupSchedules[index],
                      );
                    },
                  ),
                ),
              if (displaySwiper) const SizedBox(height: 15),
              if (displaySwiper)
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
              if (!displaySwiper)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Reached the end and still hungry for plans? 🤔 If none of your group schedule fits, why not propose your own lunchtime? All people sharing a group with you will be able to join.",
                    style: StyleConsts.textSecondary,
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
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
