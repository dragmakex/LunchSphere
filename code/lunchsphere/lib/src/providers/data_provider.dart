import 'package:flutter/foundation.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/services/api_service.dart';

class DataProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<GroupScheduleModel> groupSchedules = [];
  bool isLoading = true;

  DataProvider() {
    _loadGroupSchedules();
  }
  Future<void> _loadGroupSchedules() async {
    groupSchedules = await apiService.getGroupSchedules();
    // sort group schedules by time, time is in format "hh:mm", compare hours then minutes
    groupSchedules.sort((a, b) => int.parse(a.time.split(":")[0])
                .compareTo(int.parse(b.time.split(":")[0])) ==
            0
        ? int.parse(a.time.split(":")[1])
            .compareTo(int.parse(b.time.split(":")[1]))
        : int.parse(a.time.split(":")[0])
            .compareTo(int.parse(b.time.split(":")[0])));
    isLoading = false;
    notifyListeners();
  }
}
