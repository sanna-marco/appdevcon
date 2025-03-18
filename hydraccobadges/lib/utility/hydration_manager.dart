import 'package:hydraccobadges/utility/pigeon.g.dart';

/// Very basic example on how to move data from Flutter
/// to native
class HydrationManager implements FlutterHydrationRepository {
  @override
  Future<List<DtoHydration>> getHydrations() {
    return Future.value([DtoHydration(id: 1, amount: 2, date: "Yesterday")]);
  }
}
