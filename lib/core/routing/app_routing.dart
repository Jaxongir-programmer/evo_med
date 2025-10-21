// DO NOT DELETE THIS COMMENTED CODE
//::IMPORTS::
import 'package:evo_med/features/add_announcement/presentation/pages/add_announcement_screen.dart';
import 'package:evo_med/features/add_announcement/presentation/pages/add_images_screen.dart';
import 'package:evo_med/features/add_announcement/presentation/pages/point_from_map_screen.dart';
import 'package:evo_med/features/add_announcement/presentation/pages/upload_images_screen.dart';
import 'package:evo_med/features/estate_detail/presentation/pages/estate_detail_screen.dart';
import 'package:evo_med/features/estate_announcement/presentation/pages/estate_announcement_screen.dart';
import 'package:evo_med/features/estate_announcement/presentation/pages/search_from_map_screen.dart';
import 'package:evo_med/features/home/presentation/pages/messages/message_detail_screen.dart';
import 'package:evo_med/features/home/presentation/pages/messages/messages_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/about_app_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/account/account_info_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/account/change_login_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/account/change_password_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/balance/fill_balance_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/balance/my_balance_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/my_announcement/my_announcement_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/notification/notifications_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/notification/sent_to_new_email_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/payment_history/payment_history_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/profile_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/setting/app_settings.dart';
import 'package:evo_med/features/profile/presentation/pages/setting/change_language_screen.dart';
import 'package:evo_med/features/profile/presentation/pages/packages/packages_screen.dart';
import 'package:evo_med/features/saved/presentation/pages/saved_screen.dart';
import 'package:evo_med/features/services/presentation/pages/about_service_screen.dart';
import 'package:evo_med/features/services/presentation/pages/order_service_screen.dart';
import 'package:evo_med/features/services/presentation/pages/service_order_success_screen.dart';
import 'package:evo_med/features/services/presentation/pages/services_screen.dart';
import 'package:evo_med/features/my_estate/presentation/pages/my_estate_detail_screen.dart';
import 'package:evo_med/features/my_estate/presentation/pages/identify/id_privacy_policy_screen.dart';
import 'package:evo_med/features/my_estate/presentation/pages/identify/id_signpad_screen.dart';
import 'package:evo_med/features/my_estate/presentation/pages/identify/identify_screen.dart';
import 'package:evo_med/features/my_estate/presentation/pages/my_estates_screen.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/features/auth/presentation/pages/complete_register_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/confirm_otp_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/forget_password/set_new_password_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/pincode/confirm_pincode_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/login_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/pincode/login_with_pincode_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/privacy_policy_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/register_screen.dart';
import 'package:evo_med/features/auth/presentation/pages/pincode/set_pincode_screen.dart';
import 'package:evo_med/features/common/presentation/page/success_screen.dart';
import 'package:evo_med/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:evo_med/features/on_boarding/presentation/pages/start_select_language_screen.dart';
import 'package:evo_med/features/home/presentation/pages/home_screen.dart';
import 'package:evo_med/features/on_boarding/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/main.dart';

import '../../features/auth/presentation/pages/forget_password/fp_confirm_otp_screen.dart';
import '../../features/profile/presentation/pages/saved_announce/saved_announces_screen.dart';

class AppRouter {
  // DO NOT DELETE THIS COMMENTED CODE
  //::NAMES::

  static const String addAnnouncement = '/addAnnouncement';
  static const String uploadImages = 'addAnnouncement/uploadImages';
  static const String addImages = 'addAnnouncement/uploadImages/addImages';
  static const String pointFromMap = 'addAnnouncement/pointFromMap';

  static const String splash = '/';
  static const String startSelectLanguage = '/startSelectLanguage';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String completeRegister = '/completeRegister';
  static const String privacyPolicy = '/privacyPolicy';
  static const String confirmOtpScreen = '/confirmOtpScreen';
  static const String successScreen = '/successScreen';

  static const String estateAnnouncement = '/estateAnnouncement';
  static const String searchFromMap = 'estateAnnouncement/searchFromMap';

  static const String setPinCode = '/setPinCode';
  static const String confirmPinCode = '/confirmPinCode';
  static const String loginWithPinCode = '/loginWithPinCode';

  static const String forgetPassword = '/forgetPassword';
  static const String fpOtpConfirm = '/fpOtpConfirm';
  static const String setNewPassword = '/setNewPassword';

  static const String home = '/home';
  static const String messages = 'home/messages';
  static const String messagesDetail = 'messages/detail';

  static const String saved = '/saved';

  /// Profile section
  static const String profile = '/profile';
  static const String myAnnouncementScreen = 'profile/myAnnouncementScreen';

  static const String myBalance = 'profile/myBalance';
  static const String fillBalance = 'profile/myBalance/fillBalance';

  static const String paymentHistory = 'profile/paymentHistory';

  static const String accountInfo = 'profile/accountInfo';
  static const String changeLogin = 'profile/accountInfo/changeLogin';
  static const String changePassword = 'profile/accountInfo/changePassword';

  static const String aboutApp = 'profile/aboutApp';

  static const String appSetting = 'profile/appSetting';
  static const String changeLanguage = 'profile/appSetting/changeLanguage';

  static const String notifications = 'profile/notifications';
  static const String sentToNewEmail = 'profile/notifications/sentToNewEmail';

  static const String tariffs = 'profile/packages';
  static const String savedAnnounce = 'profile/savedAnnounce';

  static const String myEstates = '/myEstates';
  static const String myEstateIdentify = 'my_estate/identify';
  static const String myEstateIdPrivacy = 'my_estate/myEstateIdPrivacy';
  static const String myEstateIdSignPad = 'my_estate/myEstateIdSignPad';
  static const String myEstateDetail = 'my_estate/myEstateDetail';

  static const String estateAnnounceDetail = '/estateAnnounceDetail';

  /// This is for services for estates
  static const String services = 'my_estate/services';
  static const String servicesAboutServices = 'my_estate/services/servicesAboutServices';
  static const String orderServices = 'my_estate/services/orderServices';
  static const String orderServicesSuccess = 'my_estate/services/orderServices/orderServicesSuccess';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: splash,
        name: splash,
        builder: (context, state) => SplashScreen(),
      ),

      GoRoute(
        name: startSelectLanguage,
        path: startSelectLanguage,
        builder: (context, state) => StartSelectLanguageScreen(),
      ),

      GoRoute(
        name: onBoarding,
        path: onBoarding,
        builder: (context, state) => OnBoardingScreen(),
      ),

      GoRoute(
        name: login,
        path: login,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        name: register,
        path: register,
        builder: (context, state) => RegisterScreen(),
      ),

      GoRoute(
        name: completeRegister,
        path: completeRegister,
        builder: (context, state) => CompleteRegisterScreen(),
      ),

      GoRoute(
        name: privacyPolicy,
        path: privacyPolicy,
        builder: (context, state) => PrivacyPolicyScreen(),
      ),

      GoRoute(
        name: confirmOtpScreen,
        path: confirmOtpScreen,
        builder: (context, state) => ConfirmOTPScreen(),
      ),

      GoRoute(
        name: successScreen,
        path: successScreen,
        builder: (context, state) => SuccessScreen(type: state.extra as SuccessType),
      ),

      GoRoute(
        name: setPinCode,
        path: setPinCode,
        builder: (context, state) => SetPinCodeScreen(),
      ),

      GoRoute(
        name: confirmPinCode,
        path: confirmPinCode,
        builder: (context, state) => ConfirmPinCodeScreen(),
      ),

      GoRoute(
        name: loginWithPinCode,
        path: loginWithPinCode,
        builder: (context, state) => LoginWithPinCodeScreen(),
      ),

      GoRoute(
        name: forgetPassword,
        path: forgetPassword,
        builder: (context, state) => ForgetPassword(),
      ),

      GoRoute(
        name: fpOtpConfirm,
        path: fpOtpConfirm,
        builder: (context, state) => FPConfirmOTPScreen(),
      ),

      GoRoute(
        name: setNewPassword,
        path: setNewPassword,
        builder: (context, state) => SetNewPasswordScreen(),
      ),

      GoRoute(
        name: home,
        path: home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: messages,
            path: messages,
            builder: (context, state) => MessagesScreen(),
            routes: [
              GoRoute(
                name: messagesDetail,
                path: messagesDetail,
                builder: (context, state) => MessageDetailScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        name: saved,
        path: saved,
        builder: (context, state) => SavedScreen(),
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: estateAnnouncement,
        path: estateAnnouncement,
        builder: (context, state) => EstateAnnouncementScreen(),
        routes: [
          GoRoute(
            name: searchFromMap,
            path: searchFromMap,
            builder: (context, state) => SearchFromMapScreen(),
          ),
        ],
      ),

      GoRoute(
        name: estateAnnounceDetail,
        path: estateAnnounceDetail,
        builder: (context, state) => EstateAnnounceDetailScreen(estateType: state.extra as EstateType),
      ),

      GoRoute(
        name: profile,
        path: profile,
        builder: (context, state) => ProfileScreen(),
        routes: [
          GoRoute(
            name: myAnnouncementScreen,
            path: myAnnouncementScreen,
            builder: (context, state) => MyAnnouncementScreen(),
          ),
          GoRoute(
            name: accountInfo,
            path: accountInfo,
            builder: (context, state) => AccountInfoScreen(),
            routes: [
              GoRoute(
                name: changeLogin,
                path: changeLogin,
                builder: (context, state) => ChangeLoginScreen(),
              ),
              GoRoute(
                name: changePassword,
                path: changePassword,
                builder: (context, state) => ChangePasswordScreen(),
              ),
            ],
          ),
          GoRoute(
            name: myBalance,
            path: myBalance,
            builder: (context, state) => MyBalanceScreen(),
            routes: [
              GoRoute(
                name: fillBalance,
                path: fillBalance,
                builder: (context, state) => FillBalanceScreen(),
              ),
            ],
          ),
          GoRoute(
            name: paymentHistory,
            path: paymentHistory,
            builder: (context, state) => PaymentHistoryScreen(),
          ),
          GoRoute(
            name: aboutApp,
            path: aboutApp,
            builder: (context, state) => AboutAppScreen(),
          ),
          GoRoute(
            name: tariffs,
            path: tariffs,
            builder: (context, state) => PackagesScreen(),
          ),
          GoRoute(
            name: savedAnnounce,
            path: savedAnnounce,
            builder: (context, state) => SavedAnnouncesScreen(),
          ),
          GoRoute(
            name: appSetting,
            path: appSetting,
            builder: (context, state) => AppSettings(),
            routes: [
              GoRoute(
                name: changeLanguage,
                path: changeLanguage,
                builder: (context, state) => ChangeLanguageScreen(),
              ),
            ],
          ),
          GoRoute(
            name: notifications,
            path: notifications,
            builder: (context, state) => NotificationScreen(),
            routes: [
              GoRoute(
                name: sentToNewEmail,
                path: sentToNewEmail,
                builder: (context, state) => SentToNewEmailScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        name: myEstates,
        path: myEstates,
        builder: (context, state) => MyEstatesScreen(),
        routes: [
          GoRoute(
            name: myEstateIdentify,
            path: myEstateIdentify,
            builder: (context, state) => IdentifyScreen(),
            routes: [],
          ),
          GoRoute(
            name: myEstateIdPrivacy,
            path: myEstateIdPrivacy,
            builder: (context, state) => IdPrivacyPolicyScreen(),
            routes: [],
          ),
          GoRoute(
            name: myEstateIdSignPad,
            path: myEstateIdSignPad,
            builder: (context, state) => IdSignPadScreen(),
            routes: [],
          ),
          GoRoute(
            name: myEstateDetail,
            path: myEstateDetail,
            builder: (context, state) => MyEstateDetailScreen(),
            routes: [],
          ),
          GoRoute(name: services, path: services, builder: (context, state) => ServicesScreen(), routes: [
            GoRoute(
              name: servicesAboutServices,
              path: servicesAboutServices,
              builder: (context, state) => AboutServiceScreen(title: state.extra as String),
              routes: [],
            ),
            GoRoute(
              name: orderServices,
              path: orderServices,
              builder: (context, state) => OrderServiceScreen(),
              routes: [
                GoRoute(
                  name: orderServicesSuccess,
                  path: orderServicesSuccess,
                  builder: (context, state) => ServiceOrderSuccessScreen(),
                  routes: [],
                ),
              ],
            ),
          ]),
        ],
      ),

      // DO NOT DELETE THIS COMMENTED CODE
      //::ROUTES::

      GoRoute(
        name: addAnnouncement,
        path: addAnnouncement,
        builder: (context, state) => AddAnnouncementScreen(),
        routes: [
          GoRoute(
            name: uploadImages,
            path: uploadImages,
            builder: (context, state) => UploadImagesScreen(),
            routes: [
              GoRoute(
                name: addImages,
                path: addImages,
                builder: (context, state) => AddImagesScreen(),
                routes: [],
              ),
            ],
          ),
          GoRoute(
            name: pointFromMap,
            path: pointFromMap,
            builder: (context, state) => PointFromMapScreen(),
            routes: [],
          ),
        ],
      ),
    ],
  );
}
