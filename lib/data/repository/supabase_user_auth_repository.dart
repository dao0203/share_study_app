import 'package:share_study_app/data/repository/user_auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseUserAuthRepository implements UserAuthRepository {
  @override
  bool isUserSignedIn() {
    return Supabase.instance.client.auth.currentSession != null;
  }

  @override
  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  Future<void> signIn(String email, String password) async {
    await Supabase.instance.client.auth
        .signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await Supabase.instance.client.auth
        .signUp(email: email, password: password);
  }
}
