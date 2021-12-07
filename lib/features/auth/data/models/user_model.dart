import 'dart:convert';

import 'package:flutter_clean/features/auth/auth.dart';

class UserModel extends User {
  final String name;
  final DateTime bornDate;
  final String pictureUrl;
  final String email;

  UserModel({
    required this.name,
    required this.bornDate,
    required this.pictureUrl,
    required this.email,
  }) : super(
          name: name,
          bornDate: bornDate,
          pictureUrl: pictureUrl,
          email: email,
        );

  UserModel copyWith({
    String? name,
    DateTime? bornDate,
    String? pictureUrl,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      bornDate: bornDate ?? this.bornDate,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bornDate': bornDate.toIso8601String(),
      'pictureUrl': pictureUrl,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      bornDate: DateTime.parse(map['bornDate']),
      pictureUrl: map['pictureUrl'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, bornDate: $bornDate, pictureUrl: $pictureUrl, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.bornDate == bornDate &&
        other.pictureUrl == pictureUrl &&
        other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        bornDate.hashCode ^
        pictureUrl.hashCode ^
        email.hashCode;
  }
}
