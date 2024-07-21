import 'package:baseapp/app/main/main_page.dart';
import 'package:baseapp/app/main/notification_screen.dart';
import 'package:baseapp/app/main/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:myutils/base/router/app_router.dart';

import '../app/main/home_screen.dart';
import '../app/main/splash_page.dart';
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
BuildContext? get rootContext => _rootNavigatorKey.currentState?.context;

final b2cBaseRouters = [
  // ...authenticationRouters,

  // ...b2cChildRouters,
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: SplashScreen.route,
    builder: (context, state) => const SplashScreen(),
  ),
  ...homeShellRouter,
  // ...bookingWithRootKeyRouters,
];

final myRouter = AppRouter(
  initialLocation: SplashScreen.route,
  routers: b2cBaseRouters,
  rootNavigatorKey: _rootNavigatorKey,
).generateRouter();

final List<RouteBase> homeShellRouter = [
  //MARK: Only use for puporse rebuild page when change tab
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) => const MainPage(),
    routes: [
      GoRoute(
        path: HomeScreen.route,
        name: "home",
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: HomeScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: NotificationScreen.route,
        parentNavigatorKey: _shellNavigatorKey,
        // builder: (context, state) {
        //   return GtdMyBookingPage(
        //     key: state.pageKey,
        //     viewModel: GtdMyBookingPageViewModel(),
        //   );
        // },
        pageBuilder: (context, state) => NoTransitionPage(
            child: NotificationScreen(
              key: state.pageKey,
            )),
      ),
      GoRoute(
        parentNavigatorKey: _shellNavigatorKey,
        path: ProfileScreen.route,
        // builder: (context, state) => PromotionPage(viewModel: PromotionPageViewModel()),
        pageBuilder: (context, state) {
          return NoTransitionPage(key: state.pageKey, child: ProfileScreen()
            // child: Scaffold(
            //   body: Center(child: Text("Promotions")),
            // ),
          );
        },
      ),
    ],
  ),
];