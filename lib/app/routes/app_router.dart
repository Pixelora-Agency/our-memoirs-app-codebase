import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/features/camera_session/presentation/bloc/camera_session_cubit.dart';
import 'package:our_memoirs_codebase/features/camera_session/presentation/page/camera_session_page.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';
import 'package:our_memoirs_codebase/features/frame_selection/presentation/bloc/frame_selection_cubit.dart';
import 'package:our_memoirs_codebase/features/frame_selection/presentation/page/frame_selection_page.dart';
import 'package:our_memoirs_codebase/features/instruction/presentation/page/instruction_page.dart';
import 'package:our_memoirs_codebase/features/onboarding/presentation/bloc/device_setting_cubit.dart';
import 'package:our_memoirs_codebase/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:our_memoirs_codebase/features/payment/presentation/bloc/payment_cubit.dart';
import 'package:our_memoirs_codebase/features/payment/presentation/page/payment_page.dart';
import 'package:our_memoirs_codebase/features/result/presentation/bloc/result_cubit.dart';
import 'package:our_memoirs_codebase/features/result/presentation/page/result_page.dart';
import 'package:our_memoirs_codebase/features/review_order/presentation/bloc/review_order_cubit.dart';
import 'package:our_memoirs_codebase/features/review_order/presentation/page/revieworder_page.dart';

class AppRoutes {
  static const onboarding = '/';
  static const instruction = '/instruction';
  static const payment = '/payment';
  static const frameSelection = '/frame-selection';
  static const cameraSession = '/camera-session';
  static const result = '/result';
  static const reviewOrder = '/review-order';
}

CustomTransitionPage<T> fadePage<T>({
  required GoRouterState state,
  required Widget child,
  Duration duration = const Duration(milliseconds: 500),
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      pageBuilder: (context, state) => fadePage(
        state: state,
        child: BlocProvider(
          lazy: false,
          create: (context) => DeviceSettingCubit()..initDevices(),
          child: const OnboardingPage(),
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.instruction,
      pageBuilder: (context, state) =>
          fadePage(state: state, child: const InstructionPage()),
    ),
    GoRoute(
      path: AppRoutes.reviewOrder,
      pageBuilder: (context, state) {
        return fadePage(
          state: state,
          child: BlocProvider(
            create: (context) => ReviewOrderCubit()..fetchOrderData(),
            child: const ReviewOrderPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.payment,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final String orderId = extra?['idOrder'] ?? '';
        return fadePage(
          state: state,
          child: BlocProvider(
            create: (context) => PaymentCubit()..startTimer(orderId),
            child: const PaymentPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.frameSelection,
      pageBuilder: (context, state) => fadePage(
        state: state,
        child: BlocProvider(
          create: (context) => FrameCubit(),
          child: const FrameSelectionPage(),
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.cameraSession,
      pageBuilder: (context, state) {
        final frame = state.extra as FrameModel;
        return fadePage(
          state: state,
          child: BlocProvider(
            create: (context) => CameraSessionCubit()..initialPrepare(frame),
            child: const CameraSessionPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.result,
      pageBuilder: (context, state) {
        final String imagePaths = state.extra as String;
        return fadePage(
          state: state,
          child: BlocProvider(
            create: (context) => ResultCubit()..initialRender(imagePaths),
            child: const ResultPage(),
          ),
        );
      },
    ),
  ],
);
