import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final DateTime bornDate;
  final String pictureUrl;
  final String email;

  User({
    required this.name,
    required this.bornDate,
    required this.pictureUrl,
    required this.email,
  });

  @override
  List<Object> get props => [name, bornDate, pictureUrl, email];

  User copyWith({
    String? name,
    DateTime? bornDate,
    String? pictureUrl,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      bornDate: bornDate ?? this.bornDate,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bornDate': bornDate.millisecondsSinceEpoch,
      'pictureUrl': pictureUrl,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      bornDate: DateTime.fromMillisecondsSinceEpoch(map['bornDate']),
      pictureUrl: map['pictureUrl'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
