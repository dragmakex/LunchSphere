import 'package:lunchsphere/src/models/profile_model.dart';

class GroupScheduleModel {
  final String groupName;
  final String time;
  final String place;
  final List<ProfileModel> profilesJoining;
  final List<ProfileModel> profilesPending;
  final int id;
  final String code;
  final List<ProfileModel> members;

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
  static List<ProfileModel> getMembers(GroupScheduleModel groupSchedule) {
    return groupSchedule.profilesJoining + groupSchedule.profilesPending;
  }

  static List<ProfileModel> _deserializeProfiles(List<dynamic> jsonProfiles) {
    return jsonProfiles.map((json) => ProfileModel.fromJson(json)).toList();
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
