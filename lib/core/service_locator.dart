import 'package:get_it/get_it.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/network/dio_handler.dart';

// DO DELETE THIS COMMENTED CODE
// ::IMPORTS::
import 'package:evo_med/features/add_announcement/data/data_sources/add_announcement_datasource.dart';
import 'package:evo_med/features/add_announcement/data/repositories/add_announcement_repository_impl.dart';
import 'package:evo_med/features/add_announcement/domain/use_cases/add_announcement_usecase.dart';
import 'package:evo_med/features/auth/data/data_sources/auth_datasource_impl.dart';
import 'package:evo_med/features/auth/domain/use_cases/check_verification_code_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/forget_password_usecase.dart';
import 'package:evo_med/features/common/data/data_source/common_datasource_impl.dart';
import 'package:evo_med/features/common/data/repositories/common_repository_impl.dart';
import 'package:evo_med/features/common/domain/use_cases/get_attribute_value_usecase.dart';
import 'package:evo_med/features/common/domain/use_cases/get_attributes_usecase.dart';
import 'package:evo_med/features/common/domain/use_cases/get_categories_usecase.dart';
import 'package:evo_med/features/common/domain/use_cases/get_locations_usecase.dart';
import 'package:evo_med/features/common/domain/use_cases/get_services_usecase.dart';
import 'package:evo_med/features/common/domain/use_cases/upload_files_usecase.dart';
import 'package:evo_med/features/estate_announcement/data/data_sources/estate_announcement_datasource_impl.dart';
import 'package:evo_med/features/home/data/data_sources/home_datasource_impl.dart';
import 'package:evo_med/features/home/domain/use_cases/get_messages_usecase.dart';
import 'package:evo_med/features/my_estate/data/data_sources/my_estate_datasource_impl.dart';
import 'package:evo_med/features/on_boarding/domain/use_cases/create_device_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/login_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/register_usecase.dart';
import 'package:evo_med/features/auth/domain/use_cases/reset_password_usecase.dart';
import 'package:evo_med/features/estate_detail/data/data_sources/estate_detail_datasource.dart';
import 'package:evo_med/features/estate_detail/data/repositories/estate_detail_repository_impl.dart';
import 'package:evo_med/features/estate_detail/domain/use_cases/estate_detail_usecase.dart';
import 'package:evo_med/features/estate_announcement/data/repositories/estate_announcement_repository_impl.dart';
import 'package:evo_med/features/estate_announcement/domain/use_cases/estate_announcement_usecase.dart';
import 'package:evo_med/features/on_boarding/data/data_sources/on_boarding_datasource_impl.dart';
import 'package:evo_med/features/profile/data/data_sources/profile_datasource_impl.dart';
import 'package:evo_med/features/profile/domain/use_cases/buy_tariff_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/get_tariffs_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/update_device_last_activity_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/update_user_activity_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/user_tariffs_usecase.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/features/saved/data/data_sources/saved_datasource_impl.dart';
import 'package:evo_med/features/saved/data/repositories/saved_repository_impl.dart';
import 'package:evo_med/features/saved/domain/use_cases/add_to_saved_usecase.dart';
import 'package:evo_med/features/saved/domain/use_cases/delete_saved_usecase.dart';
import 'package:evo_med/features/saved/domain/use_cases/get_saved_list_usecase.dart';
import 'package:evo_med/features/saved/domain/use_cases/update_saved_usecase.dart';
import 'package:evo_med/features/services/data/data_sources/services_datasource.dart';
import 'package:evo_med/features/services/data/repositories/services_repository_impl.dart';
import 'package:evo_med/features/services/domain/use_cases/services_usecase.dart';
import 'package:evo_med/features/my_estate/data/repositories/my_estate_repository_impl.dart';
import 'package:evo_med/features/my_estate/domain/use_cases/init_identification_usecase.dart';
import 'package:evo_med/features/on_boarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:evo_med/features/on_boarding/domain/use_cases/on_boarding_usecase.dart';
import 'package:evo_med/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:evo_med/features/auth/domain/use_cases/get_verification_code_usecase.dart';
import 'package:evo_med/features/home/data/repositories/home_repository_impl.dart';
import 'package:evo_med/features/home/domain/use_cases/get_home_services_usecase.dart';
import 'package:evo_med/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:evo_med/features/profile/domain/use_cases/profile_usecase.dart';

import '../features/estate_announcement/domain/use_cases/estate_announcement_count_usecase.dart';

final GetIt serviceLocator = GetIt.instance;

/// Service locator setup
Future<void> setupServiceLocator() async {
  await SharedPreferenceManager.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());

  // DO DELETE THIS COMMENTED CODE
  // ::REGISTERED_FEATURES::
  setCommonDependencies();
  setupAuthDependencies();
  setupAddAnnouncementDependencies();
  setupEstateDetailDependencies();
  setupEstateAnnouncementDependencies();
  setupSavedDependencies();
  setupServicesDependencies();
  setupMyEstateDependencies();
  setupOnBoardingDependencies();
  setupHomeDependencies();
  setupProfileDependencies();
}

void setCommonDependencies() {
  serviceLocator
    ..registerLazySingleton(() => CommonDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => CommonRepositoryImpl(commonDataSource: serviceLocator<CommonDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => GetCategoriesUseCase(repository: serviceLocator<CommonRepositoryImpl>()))
    ..registerLazySingleton(() => GetAttributesUseCase(repository: serviceLocator<CommonRepositoryImpl>()))
    ..registerLazySingleton(() => GetAttributeValueUseCase(repository: serviceLocator<CommonRepositoryImpl>()))
    ..registerLazySingleton(() => GetLocationsUseCase(repository: serviceLocator<CommonRepositoryImpl>()))
    ..registerLazySingleton(() => GetServicesUseCase(repository: serviceLocator<CommonRepositoryImpl>()))
    ..registerLazySingleton(() => UploadFilesUseCase(repository: serviceLocator<CommonRepositoryImpl>()));
}

// DO DELETE THIS COMMENTED CODE
// ::METHODS::

void setupAuthDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => AuthDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => AuthRepositoryImpl(authDataSource: serviceLocator<AuthDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => GetVerificationCodeUseCase(authRepository: serviceLocator<AuthRepositoryImpl>()))
    ..registerLazySingleton(() => RegisterUseCase(authRepository: serviceLocator<AuthRepositoryImpl>()))
    ..registerLazySingleton(() => ResetPasswordUseCase(authRepository: serviceLocator<AuthRepositoryImpl>()))
    ..registerLazySingleton(() => LoginUseCase(authRepository: serviceLocator<AuthRepositoryImpl>()))
    ..registerLazySingleton(() => ForgetPasswordUseCase(authRepository: serviceLocator<AuthRepositoryImpl>()))
    ..registerLazySingleton(() => CheckVerificationCodeUseCase(authRepository: serviceLocator<AuthRepositoryImpl>()));

  // Bloc
}

void setupAddAnnouncementDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => AddAnnouncementDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(
        () => AddAnnouncementRepositoryImpl(addAnnouncementDataSource: serviceLocator<AddAnnouncementDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(
        () => AddAnnouncementUseCase(addAnnouncementRepository: serviceLocator<AddAnnouncementRepositoryImpl>()));
}

void setupEstateDetailDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => EstateDetailDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(
        () => EstateDetailRepositoryImpl(estateDetailDataSource: serviceLocator<EstateDetailDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(
        () => EstateDetailUseCase(estateDetailRepository: serviceLocator<EstateDetailRepositoryImpl>()));
}

void setupEstateAnnouncementDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => EstateAnnouncementDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => EstateAnnouncementRepositoryImpl(
        estateAnnouncementDataSource: serviceLocator<EstateAnnouncementDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => GetRealEstateAnnouncementUseCase(
        estateAnnouncementRepository: serviceLocator<EstateAnnouncementRepositoryImpl>()))

    ..registerLazySingleton(() => GetRealEstateAnnouncementCountUseCase(
        estateAnnouncementRepository: serviceLocator<EstateAnnouncementRepositoryImpl>()));
}

void setupSavedDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => SavedDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => SavedRepositoryImpl(savedDataSource: serviceLocator<SavedDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => AddToSavedUseCase(savedRepository: serviceLocator<SavedRepositoryImpl>()))
    ..registerLazySingleton(() => DeleteSavedUseCase(savedRepository: serviceLocator<SavedRepositoryImpl>()))
    ..registerLazySingleton(() => UpdateSavedUseCase(savedRepository: serviceLocator<SavedRepositoryImpl>()))
    ..registerLazySingleton(() => GetSavedListUseCase(savedRepository: serviceLocator<SavedRepositoryImpl>()));
}

void setupServicesDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => ServicesDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => ServicesRepositoryImpl(servicesDataSource: serviceLocator<ServicesDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => ServicesUseCase(servicesRepository: serviceLocator<ServicesRepositoryImpl>()));
}

void setupMyEstateDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => MyEstateDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => MyEstateRepositoryImpl(myEstateDataSource: serviceLocator<MyEstateDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(
        () => InitIdentificationUseCase(myEstateRepository: serviceLocator<MyEstateRepositoryImpl>()));
}

void setupOnBoardingDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => OnBoardingDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(
        () => OnBoardingRepositoryImpl(onBoardingDataSource: serviceLocator<OnBoardingDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => CreateDeviceUseCase(onBoardingRepository: serviceLocator<OnBoardingRepositoryImpl>()))
    ..registerLazySingleton(() => OnBoardingUseCase(onBoardingRepository: serviceLocator<OnBoardingRepositoryImpl>()));
}

void setupHomeDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => HomeDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => HomeRepositoryImpl(homeDataSource: serviceLocator<HomeDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => GetMessagesUseCase(homeRepository: serviceLocator<HomeRepositoryImpl>()))
    ..registerLazySingleton(() => GetHomeServicesUseCase(homeRepository: serviceLocator<HomeRepositoryImpl>()));
}

void setupProfileDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => ProfileDataSourceImpl(serviceLocator<DioSettings>().dio()))

    // Repositories
    ..registerLazySingleton(() => ProfileRepositoryImpl(profileDataSource: serviceLocator<ProfileDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => ProfileUseCase(profileRepository: serviceLocator<ProfileRepositoryImpl>()))
    ..registerLazySingleton(() => GetTariffsUseCase(profileRepository: serviceLocator<ProfileRepositoryImpl>()))
    ..registerLazySingleton(() => BuyTariffUseCase(profileRepository: serviceLocator<ProfileRepositoryImpl>()))
    ..registerLazySingleton(() => UpdateUserActivityUseCase(profileRepository: serviceLocator<ProfileRepositoryImpl>()))
    ..registerLazySingleton(() => GetUserTariffsUseCase(profileRepository: serviceLocator<ProfileRepositoryImpl>()))
    ..registerLazySingleton(
        () => UpdateDeviceLastActivityUseCase(profileRepository: serviceLocator<ProfileRepositoryImpl>()))
    ..registerLazySingleton(
      () => ProfileBloc(
          profileUseCase: serviceLocator(),
          updateDeviceLastActivityUseCase: serviceLocator(),
          updateUserActivityUseCase: serviceLocator()),
    );
}
