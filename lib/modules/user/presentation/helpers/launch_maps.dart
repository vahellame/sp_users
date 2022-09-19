import 'package:maps_launcher/maps_launcher.dart';
import 'package:sp_users/modules/user/domain/domain.dart';

void launchMapsUrl(Geo geo) async {
  MapsLauncher.launchCoordinates(geo.lat, geo.lng);
}
