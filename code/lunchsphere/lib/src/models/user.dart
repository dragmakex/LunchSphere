class User {
  final int id;
  final String name;
  final String email;
  final String profileImageUrl;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.profileImageUrl});

  // Factory constructor to create a User object from a map (e.g., Firestore document)
  factory User.fromMap(Map<String, dynamic> data, int id) {
    return User(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImageUrl: data['profileImageUrl'],
    );
  }

  // Method to convert User object to a map, e.g., for uploading to Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }

  // Deserializing (or 'decoding') JSON to User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  // Serializing (or 'encoding') User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }
}
