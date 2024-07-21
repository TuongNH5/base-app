import 'package:baseapp/router/my_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myutils/configofmypt/config/app_config.dart';
import 'package:myutils/configofmypt/config/day_one_application.dart';
import 'package:myutils/configofmypt/config/injection.dart';
import 'package:myutils/utils/app_bloc_observer/app_bloc_observer.dart';

Future<void> main() async {
  ///
  // AppConst.shared.appScheme = MyAppScheme.uatB2C;
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    initializeDependencies(Flavor.staging),
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = AppBlocObserver();
  runApp(DayOneApplication(appRouter: myRouter,));

}
