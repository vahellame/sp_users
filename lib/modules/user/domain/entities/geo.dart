import 'package:sp_users/modules/user/domain/domain.dart';

part 'geo.freezed.dart';
part 'geo.g.dart';

@freezed
class Geo with _$Geo {
  factory Geo({
    @StringToDoubleConverter() required double lat,
    @StringToDoubleConverter() required double lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
