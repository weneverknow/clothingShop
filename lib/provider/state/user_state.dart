import 'package:ecommerce_mvvm/model/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoggedIn extends UserState {
  final User user;
  UserLoggedIn(this.user);
  @override
  List<Object?> get props => [user];
}

class UnauthorizedUser extends UserState {
  @override
  List<Object?> get props => [];
}
