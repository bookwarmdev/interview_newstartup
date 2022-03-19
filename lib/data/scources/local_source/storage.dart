import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final _storage = const FlutterSecureStorage();

  // read value
  Future readCounterValue(String key) async {
    return await _storage.read(
      key: key,
    );
  }

  // write value
  Future storeCounterValue(String key, int value) async {
    return await _storage.write(
      key: key,
      value: value.toString(),
    );
  }
}
