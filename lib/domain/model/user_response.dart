// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserResponse {
  String id;
  String name;
  String email;
  String? deviceToken;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    this.deviceToken,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        deviceToken: json['deviceToken']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'deviceToken': deviceToken,
      };

  @override
  String toString() {
    return 'UserResponse(id: $id, name: $name, email: $email, deviceToken: $deviceToken)';
  }
}
