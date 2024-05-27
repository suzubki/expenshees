import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;

  @JsonKey(name: 'picture_url')
  final String pictureUrl;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.pictureUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, email, name, pictureUrl];
}

class AuthenticatedUser extends Equatable {
  final String userId;
  final String name;
  final String accessToken;
  final String refreshToken;

  const AuthenticatedUser({
    required this.userId,
    required this.name,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [userId, name, accessToken, refreshToken];
}
