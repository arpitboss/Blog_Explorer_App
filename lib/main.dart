import 'package:blog_explorer/screens/tabs_screen.dart';
import 'package:blog_explorer/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
   const ProviderScope(child: MyApp())
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      home:const CustomTabsScreen(),
      theme: theme,
    );
  }
}