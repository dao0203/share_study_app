abstract interface class UserRepository {
  bool isUserSignedIn();
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
}
