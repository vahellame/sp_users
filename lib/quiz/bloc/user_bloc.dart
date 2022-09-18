import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_users/quiz/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial(user: UserModel(id: 42))) {
    on<UserLoadedProfile>(_onUserLoadedProfile);
  }

  Future<void> _onUserLoadedProfile(UserLoadedProfile event, Emitter<UserState> emit) async {
    final state = this.state;
    if (state is UserInitial) {
      state.user.copyWith(id: 21);
      print(state.user.toJson());
    }
  }
}
