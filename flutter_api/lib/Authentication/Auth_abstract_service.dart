import 'package:flutter_api/Authentication/token.dart';

abstract class IAuthService {
  Future<Token> signIn();
  Future<void> signOut();
}
