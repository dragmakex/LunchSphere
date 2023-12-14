import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/user.dart';

class ApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };
  Future<void> tester() async {
    try {
      await _firestore.collection('users').add(user).then(
          (DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (error) {
      if (kDebugMode) {
        print('Error adding user: $error');
      }
    }
  }

  // query for user from  tester function
  Future<void> tester2() async {
    try {
      await _firestore
          .collection('users')
          .where('first', isEqualTo: 'Ada')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          print(doc["first"]);
        });
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error getting user: $error');
      }
    }
  }
  /* Future<void> loadGroupSchedules() async {
    try {
      // Get the JSON string
      String jsonString =
          await rootBundle.loadString('assets/data/group_schedules.json ');
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
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error loading group schedules: $error');
      }
    }
  } */

  Future<List<GroupScheduleModel>> getGroupSchedules() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('groupSchedules').get();
      return querySnapshot.docs
          .map((doc) =>
              GroupScheduleModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
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
        return User.fromMap(doc.data() as Map<String, dynamic>, doc.id);
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
          .map(
              (doc) => User.fromMap(doc.data() as Map<String, dynamic>, doc.id))
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

Future<void> updateGroupScheduleTime(int groupId, String newTime) async {
  var docId = await fetchGroupDocIdByGroupId(groupId);
  if (docId != null) {
    var groupScheduleCollection = FirebaseFirestore.instance.collection('groupSchedules');
    return groupScheduleCollection
      .doc(docId)
      .update({'time': newTime})
      .then((value) => print("Group Schedule Updated"))
      .catchError((error) => print("Failed to update group schedule: $error"));
  } else {
    print("No document found for groupId: $groupId");
  }
}

Future<String?> fetchGroupDocIdByGroupId(int groupId) async {
  var groupScheduleCollection = FirebaseFirestore.instance.collection('groupSchedules');
  try {
    var querySnapshot = await groupScheduleCollection.where('id', isEqualTo: groupId).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.id;  // Return the document ID of the first matching document
    } else {
      print('No group found with name $groupId');
      return null;
    }
  } catch (e) {
    print('Error fetching group: $e');
    return null;
  }
}

String formatTimeFromTicker(int ticker) {
  // Starting time is 11:00 (11 hours and 0 minutes)
  int baseHour = 11;
  int baseMinutes = 0;

  // Calculate total minutes from the ticker
  int totalMinutes = baseMinutes + ticker * 15;

  // Calculate hours and minutes
  int hours = baseHour + totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;

  // Format to "HH:MM"
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}