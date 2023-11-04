class ProfileModel {
  final String name;
  final String avatarUrl;
  final int id;

  ProfileModel({required this.name, required this.avatarUrl, required this.id});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      avatarUrl: json['avatarUrl'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
      'id': id,
    };
  }
}
