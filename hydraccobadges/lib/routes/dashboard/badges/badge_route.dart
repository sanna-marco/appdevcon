import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hydraccobadges/routes/dashboard/badges/badge_page.dart';

/// Routes to the badge page, containing a scaffold with appbar
/// to navigate back
class BadgeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reward"),
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () => SystemNavigator.pop(), icon: Icon(Icons.close))],
      ),
      body: BadgePage(rewardMessage: "DRINKING MASTER"),
    );
  }
}

/// Routes to the badge page with a scaffold as well but without the appbar.
/// Still, the user can use swipe gestures to pop back, the [PopScope] inhibits
/// that.
class BadgeContentOnlyRoute extends GoRouteData {
  BadgeContentOnlyRoute({required this.message});
  final String message;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(body: PopScope(canPop: false, child: BadgePage(rewardMessage: message)));
  }
}
