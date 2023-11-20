import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/providers/statistics_provider.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ABChooser extends StatelessWidget {
  const ABChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWidgetFixed(
      title: "AB Choose",
      canPop: false,
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: buildButtons(context),
            ),
          ],
        ),
      ),
    );
  }

  Column buildButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          onPressed: () {
            context.read<StatisticsProvider>().stopTimer();
            context.read<StatisticsProvider>().startTimer();
            Navigator.pushNamed(
              context,
              Routes.aTest,
            );
          },
          color: StyleConsts.purplePrimary,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
          child: Text(
            "A Test",
            style: StyleConsts.buttonText.copyWith(color: StyleConsts.white),
          ),
        ),
        const SizedBox(
          height: 32,
          width: double.infinity,
        ),
        CustomButton(
          onPressed: () {
            context.read<StatisticsProvider>().stopTimer();
            context.read<StatisticsProvider>().startTimer();
            Navigator.pushNamed(
              context,
              Routes.bTest,
            );
          },
          color: StyleConsts.purplePrimary,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
          child: Text(
            "B Test",
            style: StyleConsts.buttonText.copyWith(color: StyleConsts.white),
          ),
        ),
        const SizedBox(height: 64),
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.statistics,
            );
          },
          color: StyleConsts.backgroundPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
          child: Text(
            "Statistics",
            style:
                StyleConsts.buttonText.copyWith(color: StyleConsts.greyLight),
          ),
        ),
      ],
    );
  }
}
