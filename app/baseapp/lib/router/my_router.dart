import 'package:go_router/go_router.dart';

import '../app/main/detail_screen.dart';
import '../app/main/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) => DetailsScreen(id: state.pathParameters['id']!),
    ),
  ],
);