import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', useConstantCase: true, obfuscate: true)
abstract class Env {
  @EnviedField()
  static final String firebaseAndroidApiKey = _Env.firebaseAndroidApiKey;
  @EnviedField()
  static final String firebaseIosApiKey = _Env.firebaseIosApiKey;
  @EnviedField()
  static final String firebaseAndroidAppId = _Env.firebaseAndroidAppId;
  @EnviedField()
  static final String firebaseIosAppId = _Env.firebaseIosAppId;
  @EnviedField()
  static final String firebaseMessagingSenderId =
      _Env.firebaseMessagingSenderId;
  @EnviedField()
  static final String firebaseProjectId = _Env.firebaseProjectId;
  @EnviedField()
  static final String firebaseStorageBucket = _Env.firebaseStorageBucket;
  @EnviedField()
  static final String iosBundleId = _Env.iosBundleId;
}
