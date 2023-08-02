class UserDataModel {
  final String displayName;
  final String email;
  final bool emailVerified;
  final bool isAnonymous;
  final String metadata;
  final String phoneNumber;
  final String photoURL;
  final String providerData;
  final String refreshToken;
  final String tenantId;
  final String uid;

  UserDataModel({
    required this.displayName,
    required this.email,
    required this.emailVerified,
    required this.isAnonymous,
    required this.metadata,
    required this.phoneNumber,
    required this.photoURL,
    required this.providerData,
    required this.refreshToken,
    required this.tenantId,
    required this.uid,
  });
}
