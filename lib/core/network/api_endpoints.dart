mixin ApiEndPoints {
  // DO DELETE THIS COMMENTED CODE
  // ::ENDPOINTS::

  /// Auth Endpoints
  String get getVerificationCodeEndPoint => '/auth/verify-code';

  String get checkVerificationCodeEndPoint => '/auth/verify-check';

  String get registerEndPoint => '/auth/register';

  String get forgotPasswordEndPoint => '/auth/forgot';

  String get resetPasswordEndPoint => '/auth/reset-password';

  String get loginEndPoint => '/auth/login';

  String get createDeviceEndPoint => '/v1/devices';

  /// Profile Endpoints
  String get userInfoEndPoint => '/auth/me';

  String get userActivityEndPoint => '/v1/users/activity';

  String get deviceLastActivityEndPoint => '/v1/devices/';

  String get tariffsEndPoint => '/v1/tariffs';

  String get buyTariffsEndPoint => '/v1/tariffs/{}/buy';

  String get userTariffsEndPoint => '/v1/users/tariffs';

  /// Main
  String get mainOnBoardingEndPoint => '/v1/main/onboarding';

  String get mainEndPoint => '/v1/main';

  String get messagesEndPoint => '/v1/messages';

  /// My ID Endpoints
  String get initIdentificationEndPoint => '/v1/identifications';

  String get getIdentificationDetails => '/v1/identifications';

  String get identifyEndPoint => '/v1/identifications/identification';

  /// My Estate Endpoints
  String get userEstateEndPoint => '/v1/real-estate';

  String get userCarEndPoint => '/v1/user-cars';

  /// Common EndPoint
  String get uploadFileEndPoint => '/v1/files';

  String get locationsEndPoint => '/v1/locations';

  String get attributesEndPoint => '/v1/attributes';

  String get attributeValueEndPoint => '/v1/attribute-values';

  String get categoriesEndPoint => '/v1/categories';

  String get servicesEndPoint => '/v1/services';


  /// Announcements
  String get realEstateAnnouncementEndPoint => '/v1/announcements';

  /// Saved
  String get favoritesEndPoint => '/v1/user-favorites';

  /// Estate Endpoints
  String get placeEndPointsHere => 'replace/this/with/your/end_point';
}
