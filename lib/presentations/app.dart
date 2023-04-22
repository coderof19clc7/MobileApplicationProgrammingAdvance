import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_one_learn/configs/app_configs/app_configs.dart';
import 'package:one_one_learn/configs/app_configs/app_global_navigator.dart';
import 'package:one_one_learn/configs/app_configs/app_router.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/stylings/app_themes.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = injector<AppConfig>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<TutorsCubit>()),
      ],
      child: MaterialApp(
        navigatorKey: AppGlobalNavigator.navigatorKey,
        title: appConfig.appName,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: appConfig.initialRoute,
        builder: FToastBuilder(),
      ),
    );
  }
}
