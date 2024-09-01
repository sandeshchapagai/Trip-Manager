import '../../utils/local_storage/hive_storage.dart';
import '../../utils/local_storage/secure_storage.dart';
import 'di_injection.dart';

final hiveStorage = sl.get<HiveStorage>();
final secureStorage = sl.get<SecureStorage>();
