import 'package:package_info_plus/package_info_plus.dart';
import 'package:task/domain/entities/firebase/remote_config.dart';

class RemoteConfigUtils {
  static String serverString =
      RemoteConfigServices.fetchServerStringValue("updateMessage");
  static bool hasUpdate =
      RemoteConfigServices.fetchServerboolValue("hasUpdate");
  static String appVersion =
      RemoteConfigServices.fetchServerStringValue("appVersion");
  static bool showBanner = false;
  static checkPackageVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();

    if (hasUpdate && info.version != appVersion) {
      showBanner = true;
    }
  }
}
