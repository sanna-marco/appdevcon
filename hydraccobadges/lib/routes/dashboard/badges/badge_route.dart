import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hydraccobadges/routes/dashboard/badges/badge_page.dart';

class BadgeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: Text("Reward"), backgroundColor: Colors.white),
      body: BadgePage(rewardMessage: "DRINKING MASTER"),
    );
  }
}

class BadgeContentOnlyRoute extends GoRouteData {
  BadgeContentOnlyRoute({required this.message});
  final String message;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(body: PopScope(canPop: false, child: BadgePage(rewardMessage: message)));
  }
}
