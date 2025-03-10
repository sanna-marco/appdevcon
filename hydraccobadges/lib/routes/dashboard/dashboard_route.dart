import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hydraccobadges/routes/dashboard/badges/badge_route.dart';
import 'package:hydraccobadges/routes/dashboard/dashboard_page.dart';

part 'dashboard_route.g.dart';

// Main route of the app, defaulting to the dashboard
@TypedGoRoute<DashboardRoute>(
  path: '/',
  routes: [
    TypedGoRoute<BadgeRoute>(path: 'badge'),
    TypedGoRoute<BadgeContentOnlyRoute>(path: 'badgeonly/:message'),
  ],
)
@immutable
class DashboardRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(appBar: AppBar(title: Text("Hydracco")), body: DashboardPage());
  }
}
