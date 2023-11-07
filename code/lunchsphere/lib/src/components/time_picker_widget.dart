import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

class TimePickerWidget extends StatelessWidget {
  /// ticker indicates the time in quarter hours. ie 0 = 11:00, 12 = 15:00
  final int ticker;
  final Function(int) onTickerChanged;
  const TimePickerWidget({
    super.key,
    required this.ticker,
    required this.onTickerChanged,
  });

  static String tickerToString(int ticker) {
    final hour = 11 + (ticker ~/ 4);
    final minute = (ticker % 4) * 15;
    return "$hour:${minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          color: StyleConsts.white,
          iconColor: StyleConsts.purplePrimary,
          onPressed: () {
            if (ticker > 0) onTickerChanged(ticker - 1);
          },
          icon: Icons.arrow_back_ios_new,
        ),
        SizedBox(
            width: 170,
            child: Center(
                child: Text(tickerToString(ticker),
                    style: StyleConsts.bigTimeStyle))),
        CustomIconButton(
          color: StyleConsts.white,
          iconColor: StyleConsts.purplePrimary,
          onPressed: () {
            if (ticker < 16) onTickerChanged(ticker + 1);
          },
          icon: Icons.arrow_forward_ios,
        ),
      ],
    );
  }
}
