import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/services/api_service.dart';

class DataProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<GroupScheduleModel> groupSchedules = [];
  //User user = FirebaseAuth.instance.currentUser!;
  User? user;
  bool isLoading = true;

  DataProvider() {
    _loadGroupSchedules();
  }
  double toDouble(String myTime) =>
      double.parse(myTime.split(":")[0]) +
      double.parse(myTime.split(":")[1]) / 60.0;

  Future<void> _loadGroupSchedules() async {
    await apiService.loadGroupSchedules();
    groupSchedules = await apiService.getGroupSchedules();
    // sort group schedules by time, time is in format "hh:mm", compare hours then minutes
    groupSchedules.sort((a, b) => toDouble(a.time).compareTo(toDouble(b.time)));
    isLoading = false;
    notifyListeners();
  }
}
