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
          Text("Button presses: ${provider.buttonPressCount}"),
          const SizedBox(height: 20),
          Text(
              "Time spent between AB Chooser and first committed page enter: ${provider.elapsedTime}s"),
          const SizedBox(height: 20),
          Text(
              "Time spent between each card before swiping (in seconds): ${provider.cardTimers}"),
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
        ],
      ),
    );
  }
}
