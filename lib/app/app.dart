import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sp_users/common/l10n/generated/l10n.dart';
import 'package:sp_users/common/theme.dart';
import 'package:sp_users/quiz/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vrouter/vrouter.dart';

class SPUsersApp extends StatelessWidget {
  const SPUsersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      theme: ThemeData(
        unselectedWidgetColor: Theme.of(context).firstColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Theme.of(context).firstColor),
      ),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialUrl: QuizRoute.usersPreview,
      mode: VRouterMode.history,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: [
        QuizRoute(),
      ],
    );
  }
}
