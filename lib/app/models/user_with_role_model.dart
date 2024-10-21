class UserWithRole {
  final String id;
  final String name;

  UserWithRole({required this.id, required this.name});

  // Factory method to create a UserWithRole instance from Firestore data
  factory UserWithRole.fromJson(Map<String, dynamic> json, String id) {
    return UserWithRole(
      id: id,
      name: json['email'] ?? '',
    );
  }

  // Method to convert UserWithRole to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
