import 'package:flutter/material.dart';
import 'package:hydraccobadges/routes/dashboard/badges/badge_route.dart';
import 'package:hydraccobadges/routes/dashboard/dashboard_route.dart';

/// Simple unstyled page to show a button that then pushes
/// the reward page on the navigation stack
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 50,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("REWARDS", style: Theme.of(context).textTheme.bodyLarge),
          ElevatedButton(
            onPressed: () {
              BadgeRoute().go(context);
            },
            child: Text("LIZARD REWARD"),
          ),

          /// Caution, pressing this opens the reward page without
          /// scaffold
          ElevatedButton(
            onPressed: () {
              BadgeContentOnlyRoute(message: "AWESOME DRINKER!").go(context);
            },
            child: Text("LIZARD REWARD - EMBEDDED"),
          ),
        ],
      ),
    );
  }
}
