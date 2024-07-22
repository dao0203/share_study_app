import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_study_app/app/bottom_nav_app_bar.dart';
import 'package:share_study_app/auth_gate.dart';
import 'package:share_study_app/ui/view/notification/notification_screen.dart';
import 'package:share_study_app/ui/view/onboarding/registration_profile/registration_profile_screen.dart';
import 'package:share_study_app/ui/view/onboarding/sign_in/sign_in_screen.dart';
import 'package:share_study_app/ui/view/search/search_screen.dart';
import 'package:share_study_app/ui/view/timeline/timeline_screen.dart';

class AppRouter {
  static const splash = '/splash';

  static const signIn = '/sign_in';

  static const registrationProfile = '/registration_profile';

  static const timeline = '/timeline';

  static const search = '/search';

  static const notification = '/notification';

  static final timelineKey = GlobalKey<NavigatorState>();
  static final searchKey = GlobalKey<NavigatorState>();
  static final notificationKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: splash,
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const AuthGate();
        },
      ),
      GoRoute(
        path: signIn,
        builder: (context, state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: registrationProfile,
        builder: (context, state) {
          return RegistrationProfileScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BottomNavAppBar(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: timelineKey,
            routes: [
              GoRoute(
                path: timeline,
                builder: (context, state) {
                  return const TimelineScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: searchKey,
            routes: [
              GoRoute(
                path: search,
                builder: (context, state) {
                  return const SearchScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: notificationKey,
            routes: [
              GoRoute(
                path: notification,
                builder: (context, state) {
                  return const NotificationScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
