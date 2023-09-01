import 'package:flight/core/device/constants.dart';

class BaseService {
  final firebaseServiceEndPoint = AppConstant.API_SERVICE_URL;

  String get mapsPath => "$firebaseServiceEndPoint/map.json";
}
