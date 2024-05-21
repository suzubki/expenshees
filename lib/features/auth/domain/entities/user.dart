import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? pictureUrl;

  const User({
    this.id,
    this.email,
    this.name,
    this.pictureUrl,
  });

  @override
  List<Object?> get props => [id, email, name, pictureUrl];
}
