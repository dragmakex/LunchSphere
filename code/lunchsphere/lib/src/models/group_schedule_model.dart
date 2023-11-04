import 'package:lunchsphere/src/models/profile_model.dart';

class GroupScheduleModel {
  final String groupName;
  final String time;
  final List<ProfileModel> profilesJoining;
  final List<ProfileModel> profilesPending;
  final List<ProfileModel> profilesDeclined;
  final int id;

  GroupScheduleModel({
    required this.groupName,
    required this.time,
    required this.profilesJoining,
    required this.profilesPending,
    required this.profilesDeclined,
    required this.id,
  });

  // Deserializing (or 'decoding') JSON to GroupScheduleModel
  factory GroupScheduleModel.fromJson(Map<String, dynamic> json) {
    return GroupScheduleModel(
      groupName: json['groupName'],
      time: json['time'],
      profilesJoining: _deserializeProfiles(json['profilesJoining']),
      profilesPending: _deserializeProfiles(json['profilesPending']),
      profilesDeclined: _deserializeProfiles(json['profilesDeclined']),
      id: json['id'],
    );
  }

  static List<ProfileModel> _deserializeProfiles(List<dynamic> jsonProfiles) {
    return jsonProfiles.map((json) => ProfileModel.fromJson(json)).toList();
  }

  // Serializing (or 'encoding') GroupScheduleModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'time': time,
      'profilesJoining': profilesJoining.map((x) => x.toJson()).toList(),
      'profilesPending': profilesPending.map((x) => x.toJson()).toList(),
      'profilesDeclined': profilesDeclined.map((x) => x.toJson()).toList(),
      'id': id,
    };
  }
}
