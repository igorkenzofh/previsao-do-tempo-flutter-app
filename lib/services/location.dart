import 'package:geolocator/geolocator.dart';

// TODO 8: Criar noova classe Location e transferir a afunção getlocation
class Location {
  // Location(this.latitude, this.longitude);
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    // TODO 2: Fazer como na doc, https://pub.dev/packages/geolocator
    // Todo 7: Envelopar a função com um try and catch
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude; // Quanto maior acc maior uso da bateria
      // TODO 4: Pedir permissao ao user, ir na doc e segui os passo para Android e iOS
    } catch (e) {
      print(e);
    }
  }
}
