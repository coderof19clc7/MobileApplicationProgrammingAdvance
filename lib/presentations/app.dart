import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_one_learn/configs/app_configs/app_configs.dart';
import 'package:one_one_learn/configs/app_configs/app_global_navigator.dart';
import 'package:one_one_learn/configs/app_configs/app_router.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/stylings/app_themes.dart';
import 'package:one_one_learn/core/blocs/app_settings_bloc/app_settings_cubit.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/main_screen.dart';
import 'package:one_one_learn/presentations/screens/on_boarding/on_boarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = injector<AppConfig>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppSettingsCubit(),
          lazy: false,
        ),
      ],
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (appSettingsContext, appSettingsState) {
          return MaterialApp(
            navigatorKey: AppGlobalNavigator.navigatorKey,
            title: appConfig.appName,
            onGenerateRoute: AppRouter.onGenerateRoute,
            themeMode: appSettingsState.themeMode,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            locale: appSettingsState.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeListResolutionCallback: (locales, supportedLocales) {
              // use locale from state if it is not null
              if (appSettingsState.locale != null) {
                return appSettingsState.locale;
              }

              if (kDebugMode) {
                print('locales: $locales');
                print('supportedLocales: $supportedLocales');
              }

              // locale is null then supportedLocales.first might be used as default locale
              final firstLocale = locales?.first;
              var localeToReturn = firstLocale ?? supportedLocales.first;

              // locale is not null then check if it is supported
              if (firstLocale != null) {
                var localeIsSupported = false;
                for (final supportedLocale in supportedLocales) {
                  // language code and country code is supported
                  // --> use it as default locale
                  if (supportedLocale.languageCode == firstLocale.languageCode
                      && supportedLocale.countryCode == firstLocale.countryCode
                  ) {
                    localeToReturn = Locale(
                      supportedLocale.languageCode,
                      supportedLocale.countryCode ?? '',
                    );
                    localeIsSupported = true;
                    break;
                  }
                }

                // locale is not supported then supportedLocales.first will be used as default locale
                if (!localeIsSupported) {
                  localeToReturn = supportedLocales.first;
                }
              }

              appSettingsContext.read<AppSettingsCubit>().changeLocale(
                localeToReturn.languageCode, localeToReturn.countryCode,
              );
              return localeToReturn;
            },
            supportedLocales: S.delegate.supportedLocales,
            builder: FToastBuilder(),
            home: appConfig.initialRoute == RouteNames.onBoarding
                ? const OnBoardingScreen()
                : const MainScreen(),
          );
        },
      ),
    );
  }
}
