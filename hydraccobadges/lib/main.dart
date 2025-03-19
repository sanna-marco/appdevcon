import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hydraccobadges/routes/dashboard/dashboard_route.dart';
import 'package:hydraccobadges/utility/hydration_manager.dart';
import 'package:hydraccobadges/utility/pigeon.g.dart';

void main() => runApp(HydraccoApp());

class HydraccoApp extends StatelessWidget {
  HydraccoApp({super.key});

  /// Initializing the routing, starting from the dashboard
  final _router = GoRouter(routes: $appRoutes);

  @override
  Widget build(BuildContext context) {
    /// Initialize pigeon api
    FlutterHydrationRepository.setUp(HydrationManager());

    /// Build the app
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey)),
      debugShowCheckedModeBanner: false,
    );
  }
}
