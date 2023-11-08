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
    isLoading = false;
    notifyListeners();
  }
}
