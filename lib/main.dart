import 'package:flutter/material.dart';

import 'app/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Our Memories',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }

  ///FOR TESTING FRAME
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'test frame preview',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData.dark(),
  //     home: const TestFrameScreen(),
  //   );
  // }
}
