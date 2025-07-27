import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shartflix_case/core/init/application_initialize.dart';
import 'package:shartflix_case/core/init/bloc_initialize.dart';
import 'package:shartflix_case/core/init/localization_manager.dart';
import 'package:shartflix_case/core/init/theme/custom_dark_theme.dart';
import 'package:shartflix_case/core/init/theme/custom_light_theme.dart';
import 'package:shartflix_case/core/navigation/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().init();
  runApp(LocalizationManager(child: const BlocInitialize(child: _MyApp())));
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
