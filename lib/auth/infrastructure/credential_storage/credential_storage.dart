import 'package:oauth2/oauth2.dart';

abstract class CredentialStorage {
  Future<Credentials?> read();

  Future<void> save(Credentials credentials);

  Future<void> clear();
}
