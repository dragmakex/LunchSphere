import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lunchsphere/src/models/group_schedule_model.dart';
import 'package:lunchsphere/src/models/user.dart';

class ApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<GroupScheduleModel>> getGroupSchedules() async {
    final jsonString =
        await rootBundle.loadString('assets/data/group_schedules.json');
    final jsonResponse = jsonDecode(jsonString) as List;
    return jsonResponse
        .map((scheduleJson) => GroupScheduleModel.fromJson(scheduleJson))
        .toList();
  }

  // Get a single user by ID
  // Future<User?> getUser(String userId) async {
  //   try {
  //     DocumentSnapshot doc =
  //         await _firestore.collection('users').doc(userId).get();
  //     if (doc.exists) {
  //       return User.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  //     }
  //     return null;
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Error getting user: $error');
  //     }
  //     return null;
  //   }
  // }

  // Get all users
  // Future<List<User>> getAllUsers() async {
  //   try {
  //     QuerySnapshot querySnapshot = await _firestore.collection('users').get();
  //     return querySnapshot.docs
  //         .map(
  //             (doc) => User.fromMap(doc.data() as Map<String, dynamic>, doc.id))
  //         .toList();
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Error getting user: $error');
  //     }
  //     return [];
  //   }
  // }

  // // Add a new user
  // Future<void> addUser(User user) async {
  //   try {
  //     await _firestore.collection('users').add(user.toMap());
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Error adding user: $error');
  //     }
  //   }
  // }

  // Update an existing user
  // Future<void> updateUser(String userId, User user) async {
  //   try {
  //     await _firestore.collection('users').doc(userId).update(user.toMap());
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Error updating user: $error');
  //     }
  //   }
  // }

  // // Delete a user
  // Future<void> deleteUser(String userId) async {
  //   try {
  //     await _firestore.collection('users').doc(userId).delete();
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Error deleting user: $error');
  //     }
  //   }
  // }
}
