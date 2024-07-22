import 'package:go_router/go_router.dart';
import 'package:share_study_app/auth_gate.dart';
import 'package:share_study_app/ui/view/onboarding/registration_profile/registration_profile_screen.dart';
import 'package:share_study_app/ui/view/onboarding/sign_in/sign_in_screen.dart';

class AppRouter {
  static const splash = '/splash';

  static const signIn = '/sign_in';

  static const registrationProfile = '/registration_profile';

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: splash,
    routes: [
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
    ],
  );
}
