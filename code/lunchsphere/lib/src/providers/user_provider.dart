import 'package:flutter/foundation.dart';
import 'package:lunchsphere/src/models/user.dart';
import 'package:lunchsphere/src/services/api_service.dart';

class UserProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  User? user;
  bool isLoading = true;

  UserProvider(String userId) {
    _loadUserData(userId);
  }

  Future<void> _loadUserData(String userId) async {
    user = await apiService.getUser(userId);
    isLoading = false;
    notifyListeners();
  }
}
