import 'package:trip_manager/data/repositories/bottom_navigation/bottom_navigation_repository.dart';
import 'package:trip_manager/data/repositories/main_repository/main_repository.dart';
import 'package:trip_manager/data/repositories/splash/splash_repository.dart';

import '../../../data/repositories/home_repository/home_repository.dart';
import '../../utils/local_storage/hive_storage.dart';
import '../../utils/local_storage/secure_storage.dart';
import 'di_injection.dart';

final hiveStorage = sl.get<HiveStorage>();
final secureStorage = sl.get<SecureStorage>();

//Repository
final splashRepository = sl.get<SplashRepository>();
final bottomNavigationRepository = sl.get<BottomNavigationRepository>();
final mainRepository = sl.get<MainRepository>();
final homeRepository = sl.get<HomeRepository>();
