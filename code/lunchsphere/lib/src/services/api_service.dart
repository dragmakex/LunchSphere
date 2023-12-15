import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/user.dart';

class ApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // set all users
  Future<void> setUsers() async {
    try {
      // Get the JSON string
      String jsonString = await rootBundle.loadString('assets/data/users.json');
      // Decode the JSON string into a list of objects
      List<dynamic> decodedJson = jsonDecode(jsonString);
      // Convert the list of objects into a list of User
      List<User> users =
          decodedJson.map((json) => User.fromJson(json)).toList();
      // Add the users to Firestore
      for (User user in users) {
        await _firestore.collection('users').add(user.toJson());
        // print the name + loaded
        print(user.name + " set");
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error loading users: $error');
      }
    }
  }

  Future<void> setGroupSchedules() async {
    try {
      // Get the JSON string
      String jsonString =
          await rootBundle.loadString('assets/json/groups_schedules.json');
      // Decode the JSON string into a list of objects
      List<dynamic> decodedJson = jsonDecode(jsonString);
      // Convert the list of objects into a list of GroupScheduleModel
      List<GroupScheduleModel> groupSchedules =
          decodedJson.map((json) => GroupScheduleModel.fromJson(json)).toList();
      // Add the group schedules to Firestore
      for (GroupScheduleModel groupSchedule in groupSchedules) {
        await _firestore
            .collection('groupSchedules')
            .add(groupSchedule.toJson());
        // print the name + loaded
        print(groupSchedule.groupName + " set");
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error loading group schedules: $error');
      }
    }
  }

  Future<List<GroupScheduleModel>> getGroupSchedules() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('groupSchedules').get();
      querySnapshot.docs.forEach((doc) {
        print(doc["groupName"]);
      });
      return querySnapshot.docs
          .map((doc) =>
              GroupScheduleModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      // print the name + loaded
    } catch (error) {
      if (kDebugMode) {
        print('Error getting group schedules: $error');
      }
      return [];
    }
  }

  // Get a single user by ID
  Future<User?> getUser(String userId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return User.fromMap(doc.data() as Map<String, dynamic>, doc.id as int);
      }
      return null;
    } catch (error) {
      if (kDebugMode) {
        print('Error getting user: $error');
      }
      return null;
    }
  }

  // Get all users
  Future<List<User>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      return querySnapshot.docs
          .map((doc) =>
              User.fromMap(doc.data() as Map<String, dynamic>, doc.id as int))
          .toList();
    } catch (error) {
      if (kDebugMode) {
        print('Error getting user: $error');
      }
      return [];
    }
  }

  // Add a new user
  Future<void> addUser(User user) async {
    try {
      await _firestore.collection('users').add(user.toMap());
    } catch (error) {
      if (kDebugMode) {
        print('Error adding user: $error');
      }
    }
  }

  // Update an existing user
  Future<void> updateUser(String userId, User user) async {
    try {
      await _firestore.collection('users').doc(userId).update(user.toMap());
    } catch (error) {
      if (kDebugMode) {
        print('Error updating user: $error');
      }
    }
  }

  // Delete a user
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (error) {
      if (kDebugMode) {
        print('Error deleting user: $error');
      }
    }
  }
}
