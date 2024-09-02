import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'bloc/theme/theme_bloc.dart';
import 'bloc_observer/app_bloc_observer.dart';
import 'core/app/app_states/app_states.dart';
import 'core/app/constants/app_text.dart';
import 'core/app/theme/app_themes.dart';
import 'core/config/env_config.dart';
import 'core/config/flavor_config.dart';
import 'core/enums/enums.dart';
import 'core/providers/bloc_providers.dart';
import 'core/routes/route_config.dart';
import 'core/routes/route_generator.dart';
import 'core/services/di_injection/di_injection.dart';
import 'core/services/hive/hive_service.dart';
import 'core/utils/font_scale.dart';
import 'core/utils/local_storage/app_shared_preferences.dart';
import 'core/utils/scroll_behavior_configuration.dart';

Future<void> initMainCommon({required Flavor flavor}) async {
  await initServices(flavor: flavor);
  runApp(const TripManagerApp());
}

initServices({required Flavor flavor}) async {
  var isProdFlavor = flavor == Flavor.prod;
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.sharedPrefInit();
  await dotenv.load(fileName: ".env");
  initDependencies();
  await HiveService.init();
  FlavorConfig.create(
      baseUrl: isProdFlavor ? EnvConfig.prodServerUrl : EnvConfig.betaServerUrl,
      flavor: flavor);
  Bloc.observer = AppBlocObserver();
}

class TripManagerApp extends StatelessWidget {
  const TripManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.blocProvider,
      child: MediaQuery(
        data: FontScale.scaleSize(context: context),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              scrollBehavior: ScrollBehaviorConfiguration(),
              navigatorKey: AppStates.globalKey,
              title: AppText.appName,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: state.themeMode,
              initialRoute: RouteConfig.initialRoute,
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
