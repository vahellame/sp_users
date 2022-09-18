part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}


class UserLoadedProfile extends UserEvent {
  final int id;

  const UserLoadedProfile({required this.id});

  @override
  List<Object?> get props => [id];

}