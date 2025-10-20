import 'package:permission_handler/permission_handler.dart';

final class PermissionSettings {
  static Future<PermissionStatus> checkPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isGranted) {
      return status;
    } else if (status.isPermanentlyDenied) {
      return status;
    } else {
      final result = await permission.request();
      if (result.isGranted) {
        return result;
      } else {
        return status;
      }
    }
  }
}
