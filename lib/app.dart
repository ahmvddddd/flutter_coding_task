import 'package:flutter/material.dart';
import '../../onboarding_screen.dart';
import '../../theme/theme.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: const OnboardingScreen(),
    );
  }
}