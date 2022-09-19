import 'package:sp_users/core/domain/domain.dart';

class StringToNumConverter implements JsonConverter<num, String> {
  const StringToNumConverter();

  @override
  num fromJson(String json) => num.parse(json);

  @override
  String toJson(num object) => object.toString();
}
