import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_study_app/app/bottom_nav_app_bar.dart';
import 'package:share_study_app/auth_gate.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';
import 'package:share_study_app/ui/view/follow/follow_screen.dart';
import 'package:share_study_app/ui/view/notification/notification_screen.dart';
import 'package:share_study_app/ui/view/onboarding/registration_profile/registration_profile_screen.dart';
import 'package:share_study_app/ui/view/onboarding/sign_in/sign_in_screen.dart';
import 'package:share_study_app/ui/view/onboarding/sign_up/sign_up_screen.dart';
import 'package:share_study_app/ui/view/privacy_policy/privacy_policy_screen.dart';
import 'package:share_study_app/ui/view/profile/profile_screen.dart';
import 'package:share_study_app/ui/view/profile/profile_setting_screen.dart';
import 'package:share_study_app/ui/view/question_post/question_post_screen.dart';
import 'package:share_study_app/ui/view/search/search_screen.dart';
import 'package:share_study_app/ui/view/timeline/timeline_screen.dart';
import 'package:share_study_app/ui/view/tos/tos_screen.dart';

class AppRouter {
  static const splash = '/splash';

  static const signIn = '/sign_in';

  static const signUp = '/sign_up';

  static const privacyPolicy = '/privacy_policy';

  static const tos = '/tos';

  static const registrationProfile = '/registration_profile';

  static const timeline = '/timeline';

  static const search = '/search';

  static const notification = '/notification';

  static const profile = '/profile';

  static const questionPost = '/question_post';

  static const discuss = '/discuss';

  static const follow = '/follow';

  static const profileSetting = '/profile_setting';

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
        path: signUp,
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: privacyPolicy,
        builder: (context, state) {
          return const PrivacyPolicyScreen();
        },
      ),
      GoRoute(
        path: tos,
        builder: (context, state) {
          return const TosScreen();
        },
      ),
      GoRoute(
        path: registrationProfile,
        builder: (context, state) {
          return RegistrationProfileScreen();
        },
      ),
      GoRoute(
        path: questionPost,
        pageBuilder: (context, state) {
          return _questionPostTransitionPage();
        },
      ),
      GoRoute(
        path: profileSetting,
        builder: (context, state) {
          final profile = state.extra as Profile;
          return ProfileSettingScreen(profile: profile);
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
              ..._profileRoutes,
              _discussRoute,
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
              ..._profileRoutes,
              _discussRoute,
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
              ..._profileRoutes,
              _discussRoute,
            ],
          ),
        ],
      ),
    ],
  );

  static final _profileRoutes = <RouteBase>[
    GoRoute(
      path: profile,
      builder: (context, state) {
        final profileId = state.extra as String;
        return ProfileScreen(profileId: profileId);
      },
    ),
    GoRoute(
      path: follow,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return FollowScreen(
          profileId: extra['profileId'],
          initialIndex: extra['initialIndex'],
        );
      },
    ),
  ];

  static final _discussRoute = GoRoute(
    path: discuss,
    builder: (context, state) {
      final questionId = state.extra as String;
      return DiscussionScreen(questionId: questionId);
    },
  );

  static CustomTransitionPage _questionPostTransitionPage() {
    return CustomTransitionPage(
      child: const QuestionPostScreen(),
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
