// User Model
class User {
  final String id;
  final String email;
  final String? phone;
  final String firstName;
  final String lastName;
  final String? avatarUrl;
  final String role; // buyer, seller, admin
  final String status;
  final bool emailVerified;
  final bool phoneVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    this.phone,
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
    required this.role,
    required this.status,
    required this.emailVerified,
    required this.phoneVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String,
      status: json['status'] as String,
      emailVerified: json['email_verified'] as bool,
      phoneVerified: json['phone_verified'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'avatar_url': avatarUrl,
      'role': role,
      'status': status,
      'email_verified': emailVerified,
      'phone_verified': phoneVerified,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  String get fullName => '$firstName $lastName';

  User copyWith({
    String? id,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    String? role,
    String? status,
    bool? emailVerified,
    bool? phoneVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
      status: status ?? this.status,
      emailVerified: emailVerified ?? this.emailVerified,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
