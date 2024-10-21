class UserWithRole {
  final String id;
  final String name;

  UserWithRole({required this.id, required this.name});

  // Factory method to create a UserWithRole instance from Firestore data
  factory UserWithRole.fromJson(Map<String, dynamic> json, String id) {
    return UserWithRole(
      id: id,
      name: json['email'] ?? '', // Use email as name
    );
  }

  // Method to convert UserWithRole to JSON if needed
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
