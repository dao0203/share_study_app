import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UserAuthRepository {
  bool isUserSignedIn();
  User? getCurrentUser();
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> delete();
}
