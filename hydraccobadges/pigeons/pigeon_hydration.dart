import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/utility/pigeon.g.dart',
    dartOptions: DartOptions(),
    swiftOut: '../hydracco-ios/hydracco/PigeonGenerated.swift',
    swiftOptions: SwiftOptions(),
    kotlinOut: '../hydracco-android/app/src/main/java/com/marcosanna/hydracco/util/Pigeon.g.kt',
    kotlinOptions: KotlinOptions(),
    dartPackageName: 'hydraccobadges',
  ),
)
class DtoHydration {
  final int id;
  final int amount;
  final String date;

  DtoHydration({required this.id, required this.amount, required this.date});
}

@FlutterApi()
abstract class FlutterHydrationRepository {
  @async
  List<DtoHydration> getHydrations();
}
