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
    Logger().d('signOut');
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

  @override
  Future<void> delete() async {
    await Supabase.instance.client.rpc('delete_user').then((value) async {
      Logger().d('delete user');
      await _client.signOut();
    }).onError((error, stackTrace) {
      Logger().e(error.toString() + stackTrace.toString());
      throw Exception('delete user failed');
    });
  }
}

// delete関数がなぜこうなっているか
// 参考：https://supabase.com/docs/guides/auth/managing-user-data#deleting-users
//
// supabase.instance.auth.admin.deleteUser(user.id);はしようできない、かつ
// クライアント側からは、ユーザーを削除することができない
// rpcを使用してsupabase側で作成した関数,delete_userを呼び出している
//
// この関数は、supabaseのauth.usersテーブルからauth.uidを使用してユーザーを削除する
// auth.uidはprofiles.idと一致するため、profilesテーブルからprofiles.idを使用してユーザーを削除することもできる
// すなわち、profilesテーブルのデータが削除されると、全ての関連するデータが削除される
// 
// delete関数の中でsignOut関数を呼び出しているか
// これは、delete関数を呼び出すと、ユーザーが削除されるが、
// クライアント側に削除されたはずのユーザーの情報が残ってしまうため、
// クライアント側のユーザー情報を削除するためにsignOut関数を呼び出している