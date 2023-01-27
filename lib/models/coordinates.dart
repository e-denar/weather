import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required String name,
    required double lon,
    required double lat,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}
