enum LocationPermission { denied, deniedForever, whileInUse, always, unableToDetermine }

class Position {
  final double latitude;
  final double longitude;
  Position({required this.latitude, required this.longitude});
}

class Geolocator {
  static Future<bool> isLocationServiceEnabled() async => true;
  static Future<LocationPermission> checkPermission() async => LocationPermission.whileInUse;
  static Future<LocationPermission> requestPermission() async => LocationPermission.whileInUse;
  static Future<Position> getCurrentPosition({dynamic locationSettings}) async =>
      Position(latitude: 36.1911, longitude: 43.9930);
}
