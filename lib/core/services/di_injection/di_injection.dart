import 'package:get_it/get_it.dart';
import 'package:trip_manager/data/repositories/bottom_navigation/bottom_navigation_repository.dart';
import 'package:trip_manager/data/repositories/home_repository/home_repository.dart';
import 'package:trip_manager/data/repositories/main_repository/main_repository.dart';
import 'package:trip_manager/data/repositories/splash/splash_repository.dart';

import '../../utils/local_storage/hive_storage.dart';
import '../../utils/local_storage/secure_storage.dart';
import '../socket/socket_service.dart';

final sl = GetIt.instance;

void initDependencies() {
  //Secure storage
  sl.registerLazySingleton(() => SecureStorage());

  sl.registerLazySingleton(() => HiveStorage());
  sl.registerLazySingleton(() => SocketService());

  //Repository

  sl.registerLazySingleton(() => SplashRepository());
  sl.registerLazySingleton(() => BottomNavigationRepository());
  sl.registerLazySingleton(() => MainRepository());
  sl.registerLazySingleton(() => HomeRepository());
}
