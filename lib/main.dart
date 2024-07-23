import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/pages/chat_page.dart';
import 'package:mental_health_app/pages/home_page.dart';
import 'package:mental_health_app/pages/login_page.dart';
import 'package:mental_health_app/pages/register_page.dart';
import 'package:mental_health_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) => AppProvider(), child: MyApp(),));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes:  [
      GoRoute(
        path: LoginPage.routeName,
        name: LoginPage.routeName,
        builder: (context, state) => LoginPage(),
        routes: [
          GoRoute(
            path: RegisterPage.routeName,
            name: RegisterPage.routeName,
            builder: (context, state) => RegisterPage(),
          ),
          GoRoute(
            path: HomePage.routeName,
            name: HomePage.routeName,
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: ChatPage.routeName,
                name: ChatPage.routeName,
                builder: (context, state) => const ChatPage(),
              ),
            ]
          ),
        ],
      ),

    ],
  );
}
