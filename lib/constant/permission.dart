import 'package:permission_handler/permission_handler.dart';

class PermissionDevice {
  Future<bool> requestFilePermission() async {
    PermissionStatus permStorage, permStorage2;
    permStorage = await Permission.photos.request();
    permStorage2 = await Permission.storage.request();

    if ((permStorage.isGranted || permStorage2.isGranted)) {
      return true;
    } else if ((permStorage.isDenied || permStorage2.isDenied)) {
      return false;
    }
    return false;
  }
}
