import 'package:flutter/material.dart';
import 'package:corvus/core/theme/app_theme.dart';
import 'package:corvus/routes/app_router.dart';

class CorvusApp extends StatelessWidget {
  const CorvusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Corvus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
