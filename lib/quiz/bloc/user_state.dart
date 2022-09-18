part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  final UserModel user;

  const UserInitial({required this.user});

  @override
  List<Object> get props => [user];
}
