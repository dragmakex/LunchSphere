import 'package:lunchsphere/src/models/user.dart';
import 'package:lunchsphere/src/services/api_service.dart';

class GroupScheduleModel {
  final String groupName;
  String time;
  final String place;
  final List<User> profilesJoining;
  final List<User> profilesPending;
  final int id;
  final String code;
  final List<User> members;

  GroupScheduleModel({
    required this.groupName,
    required this.time,
    required this.place,
    required this.profilesJoining,
    required this.profilesPending,
    required this.id,
    required this.code,
    required this.members,
  });

  // Deserializing (or 'decoding') JSON to GroupScheduleModel
  factory GroupScheduleModel.fromJson(Map<String, dynamic> json) {
    return GroupScheduleModel(
      // sort items by time
      groupName: json['groupName'],
      time: json['time'],
      place: json['place'],
      profilesJoining: _deserializeProfiles(json['profilesJoining']),
      profilesPending: _deserializeProfiles(json['profilesPending']),
      id: json['id'],
      code: json['code'],
      members: _deserializeProfiles(json['profilesJoining']) +
          _deserializeProfiles(json['profilesPending']),
    );
  }
  // return the join of the two lists
  static List<User> getMembers(GroupScheduleModel groupSchedule) {
    return groupSchedule.profilesJoining + groupSchedule.profilesPending;
  }

  static List<User> _deserializeProfiles(List<dynamic> id) {
    // the list contains the ID of the user, so we need to fetch the user from the database
    List users = [];
    for (var i = 0; i < id.length; i++) {
      users.add(ApiService().getUser(id[i].toString()));
    }
    return users.map((user) => User.fromJson(user)).toList();
  }

  // Serializing (or 'encoding') GroupScheduleModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'time': time,
      'place': place,
      'profilesJoining': profilesJoining.map((x) => x.toJson()).toList(),
      'profilesPending': profilesPending.map((x) => x.toJson()).toList(),
      'id': id,
      'code': code,
    };
  }
}
