class AuthResponse {
  final String accessToken;

  AuthResponse({required this.accessToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
    };
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() => {'accessToken': accessToken};
}
