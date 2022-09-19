import 'package:sp_users/core/domain/domain.dart';

class StringToDoubleConverter implements JsonConverter<double, String> {
  const StringToDoubleConverter();

  @override
  double fromJson(String json) => double.parse(json);

  @override
  String toJson(double object) => object.toString();
}
