class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl; // Optional field

  User(
      {required this.id,
      required this.name,
      required this.email,
      this.profileImageUrl});

  // Factory constructor to create a User object from a map (e.g., Firestore document)
  factory User.fromMap(Map<String, dynamic> data, String id) {
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
}
