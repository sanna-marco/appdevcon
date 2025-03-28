import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hydraccobadges/routes/dashboard/badges/badge_route.dart';
import 'package:hydraccobadges/routes/dashboard/dashboard_page.dart';

part 'dashboard_route.g.dart';

/// Main route of the app, defaulting to the dashboard.
/// The dashboard shows a simple button to display the reward.
@TypedGoRoute<DashboardRoute>(
  path: '/',
  routes: [
    /// Route from within the flutter app
    TypedGoRoute<BadgeRoute>(path: 'badge'),

    /// Route to be used without appbar
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
