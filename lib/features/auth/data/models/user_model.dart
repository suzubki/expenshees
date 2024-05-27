import 'package:json_annotation/json_annotation.dart';
import 'package:mibloc/features/auth/domain/entities/__entities.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.pictureUrl,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuthenticatedUserModel extends AuthenticatedUser {
  const AuthenticatedUserModel({
    required super.userId,
    required super.name,
    required super.accessToken,
    required super.refreshToken,
  });

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticatedUserModelToJson(this);
}
