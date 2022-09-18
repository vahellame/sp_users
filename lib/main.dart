import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_users/app/app.dart';
import 'package:sp_users/app/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = AppBlocObserver();

  _initData();

  runApp(const SPUsersApp());
}

void _initData() {
  // GetIt.I.registerSingleton(FirebaseAPI());
}
