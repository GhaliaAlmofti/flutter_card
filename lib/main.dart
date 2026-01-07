import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saees_cards/providers/auth_provider.dart';
import 'package:saees_cards/screens/auth_screens/intro_screen.dart';
import 'package:saees_cards/screens/auth_screens/splash_screen.dart';
import 'package:saees_cards/screens/handling_screens/loading_screen.dart';
import 'package:saees_cards/screens/main_screens/tabs_screen.dart';

import 'providers/auth_provider.dart';
import 'screens/auth_screens/intro_screen.dart';
import 'screens/auth_screens/splash_screen.dart';
import 'screens/handling_screens/loading_screen.dart';
import 'screens/main_screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'C Cards',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SplashScreen(),
      ),
    );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).initAuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authConsumer, _) {
        return authConsumer.status == AuthStatus.authenticated
            ? TabsScreen()
            : authConsumer.status == AuthStatus.unauthenticated
            ? IntroScreen()
            : authConsumer.status == AuthStatus.authenticating
            ? LoadingScreen()
            : LoadingScreen();
      },
    );
  }
}
