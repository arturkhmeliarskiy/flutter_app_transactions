import 'package:firebase_auth/firebase_auth.dart';
import 'package:models/models.dart';
import 'package:services/services.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(
    this.authService,
  );

  Future<UserDataModel?> signIn(String email, String password) async {
    final response = await authService.signIn(email, password);
    final result = response?.toUser() ??
        UserDataModel(
          displayName: '',
          email: '',
          emailVerified: false,
          isAnonymous: false,
          metadata: '',
          phoneNumber: '',
          photoURL: '',
          providerData: '',
          refreshToken: '',
          tenantId: '',
          uid: '',
        );

    return result;
  }
}

extension on User {
  UserDataModel toUser() {
    return UserDataModel(
      displayName: displayName ?? '',
      email: email ?? '',
      emailVerified: emailVerified,
      isAnonymous: isAnonymous,
      metadata: '',
      phoneNumber: phoneNumber ?? '',
      photoURL: photoURL ?? '',
      providerData: '',
      refreshToken: refreshToken ?? '',
      tenantId: tenantId ?? '',
      uid: uid,
    );
  }
}
