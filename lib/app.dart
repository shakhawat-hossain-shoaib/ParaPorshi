import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'core/router.dart';

class HyperlocalApp extends StatelessWidget {
  const HyperlocalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hyperlocal Hub BD',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),          // ✅ use function, not AppTheme.lightTheme
      routerConfig: buildRouter(),
    );
  }
}
