import 'package:flutter/material.dart';
import 'package:hydraccobadges/routes/dashboard/badges/badge_route.dart';
import 'package:hydraccobadges/routes/dashboard/dashboard_route.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 50,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Rewards", style: Theme.of(context).textTheme.bodyLarge),
          ElevatedButton(
            onPressed: () {
              BadgeRoute().go(context);
            },
            child: Text("Basic hydration reward"),
          ),
        ],
      ),
    );
  }
}
