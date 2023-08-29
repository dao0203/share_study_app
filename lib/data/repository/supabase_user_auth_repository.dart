import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseUserAuthRepository implements UserAuthRepository {
  final GoTrueClient _client = Supabase.instance.client.auth;
  @override
  bool isUserSignedIn() {
    return _client.currentSession != null;
  }

  @override
  Future<void> signOut() async {
    await _client.signOut();
  }

  @override
  Future<void> signIn(String email, String password) async {
    await _client.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _client.signUp(email: email, password: password);
  }
}
