// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$dashboardRoute];

RouteBase get $dashboardRoute => GoRouteData.$route(
  path: '/',

  factory: $DashboardRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: 'badge', factory: $BadgeRouteExtension._fromState),
    GoRouteData.$route(
      path: 'badgeonly/:message',

      factory: $BadgeContentOnlyRouteExtension._fromState,
    ),
  ],
);

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) => DashboardRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BadgeRouteExtension on BadgeRoute {
  static BadgeRoute _fromState(GoRouterState state) => BadgeRoute();

  String get location => GoRouteData.$location('/badge');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BadgeContentOnlyRouteExtension on BadgeContentOnlyRoute {
  static BadgeContentOnlyRoute _fromState(GoRouterState state) =>
      BadgeContentOnlyRoute(message: state.pathParameters['message']!);

  String get location =>
      GoRouteData.$location('/badgeonly/${Uri.encodeComponent(message)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
