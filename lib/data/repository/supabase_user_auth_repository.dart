import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseUserAuthRepository implements UserAuthRepository {
  final GoTrueClient _client = Supabase.instance.client.auth;
  @override
  bool isUserSignedIn() {
    return _client.currentSession != null;
  }

  @override
  User? getCurrentUser() {
    return _client.currentUser;
  }

  @override
  Future<void> signOut() async {
    await _client.signOut();
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      Logger().d('email: $email, password: $password');
      await _client.signInWithPassword(email: email, password: password);
    } on AuthException catch (e, stacktrace) {
      if (e.message == 'Invalid login credentials') {
        throw const AuthException('invalid_email_or_password');
      } else {
        Logger().e(e.message + stacktrace.toString());
        throw AuthException(e.message);
      }
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    try {
      Logger().d('email: $email, password: $password');
      await _client.signUp(email: email, password: password);
    } on AuthException catch (e, stacktrace) {
      Logger().e(e.message + stacktrace.toString());
      if (e.message == 'User already registered') {
        throw const AuthException('user_already_registered');
      } else {
        throw AuthException(e.message);
      }
    }
  }
}
