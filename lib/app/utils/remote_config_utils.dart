import 'package:task/domain/entities/firebase/remote_config.dart';

class RemoteConfigUtils {
  static String serverString =
      RemoteConfigServices.fetchServerStringValue("updateMessage");
  static bool hasUpdate =
      RemoteConfigServices.fetchServerboolValue("hasUpdate");
}
