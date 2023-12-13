import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/components/page_widget.dart';
import 'package:lunchsphere/src/components/time_picker_widget.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';

class RescheduleGroupTime extends StatefulWidget {
  final GroupScheduleModel groupSchedule;

  const RescheduleGroupTime({
    super.key,
    required this.groupSchedule,
  });

  @override
  State<RescheduleGroupTime> createState() => _RescheduleRequestPageState();
}

class _RescheduleRequestPageState extends State<RescheduleGroupTime> {
  int _timeTicker = 8;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PageWidgetFixed(
        title: "Reschedule Group Time",
        canPop: true,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("⏰ New Time", style: StyleConsts.groupSubHeader),
                const SizedBox(height: 8),
                TimePickerWidget(
                  ticker: _timeTicker,
                  onTickerChanged: (newValue) {
                    setState(() {
                      _timeTicker = newValue;
                    });
                  },
                ),
                const SizedBox(height: 32),
                const Text("💬 Comment", style: StyleConsts.groupSubHeader),
                const SizedBox(height: 8),
                CupertinoTextField(
                  placeholder:
                      'e.g. Sorry friends I have a doctor’s appointment.',
                  padding: const EdgeInsets.all(20),
                  clearButtonMode: OverlayVisibilityMode.never,
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  decoration: BoxDecoration(
                    color: StyleConsts.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  style: StyleConsts.textField,
                  placeholderStyle: StyleConsts.textFieldPlaceHolder,
                ),
                const Spacer(),
                CustomButton(
                  color: const Color.fromRGBO(71, 90, 215, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  width: double.infinity,
                  onPressed: () {
                    // BACKEND: INSERT LOGIC HERE
                    widget.groupSchedule.time = _timeTicker.toString();
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      "Set new time",
                      style: StyleConsts.buttonText
                          .copyWith(color: StyleConsts.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
