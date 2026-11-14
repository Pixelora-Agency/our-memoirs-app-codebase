import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/theme/app_theme.dart';

import 'app/routes/app_router.dart';

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
}
