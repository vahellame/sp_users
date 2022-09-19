import 'package:sp_users/modules/user/domain/domain.dart';

String formatAddress(Address address) {
  return "${address.street}, ${address.suite}";
}
