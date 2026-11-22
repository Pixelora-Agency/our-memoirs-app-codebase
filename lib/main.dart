import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _clearDevicePrefs();
    }
  }

  Future<void> _clearDevicePrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('selected_camera_name');
      await prefs.remove('selected_printer_name');
    } catch (_) {}
  }

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
