import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hsu_bakery/features/nav/presentation/screens/nav.dart';
import 'package:hsu_bakery/features/test_screens/category.dart';
import 'package:hsu_bakery/features/test_screens/detail_screen.dart';
import 'package:hsu_bakery/services/bloc_register.dart';
import 'package:hsu_bakery/services/locator.dart';
import 'package:hsu_bakery/widgets/theme.dart';

class HsuCakeWeb extends StatelessWidget {
  const HsuCakeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = getIt.call();
    return BlocRegister(
      child: MaterialApp.router(
        theme: appTheme.getAppTheme(),
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const NavScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail',
          name: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            //final String id = state.pathParameters['id']!;
            return const DetailsScreen();
          },
        ),
        GoRoute(
          path: 'category',
          name: 'category',
          builder: (context, state) {
            return const CategoryScreen();
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Something went wrong'),
    ),
  ),
);
