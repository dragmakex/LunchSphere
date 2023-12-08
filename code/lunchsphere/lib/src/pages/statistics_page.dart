import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/providers/statistics_provider.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StatisticsProvider>();
    return PageWidgetFixed(
      title: "Statistics",
      canPop: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gesture Count: ${provider.gestureCount - 1}"),
          const SizedBox(height: 20),
          // Text("Button presses: ${provider.buttonPressCount}"),
          // const SizedBox(height: 20),
          Text(
              "Time spent between AB Chooser and first committed page enter: ${provider.elapsedTime}s"),
          const SizedBox(height: 64),
          // Text(
          //     "Time spent between each card before swiping (in seconds): ${provider.cardTimers}"),
          // const SizedBox(height: 20),
          const Text(
              "The Gesture Count has already been decreased by 1 as the supervisor has to press the statistics button"),
          const SizedBox(height: 8),
          const Text(
              "There should be no need to reset. The timer and counter are reset when the user presses (A Test) or (B Test) on the first page."),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              provider.reset();
            },
            child: const Text(
              "Reset",
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text(
              "Go to Homescreen",
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
