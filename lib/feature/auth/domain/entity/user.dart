import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? token;

  User({this.token});

  @override
  List<Object?> get props => [token];
}
