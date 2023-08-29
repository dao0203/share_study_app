abstract interface class UserAuthRepository {
  bool isUserSignedIn();
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
}