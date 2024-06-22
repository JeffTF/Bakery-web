//Create storage

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = const FlutterSecureStorage();

//Read value

  Future<String?> readSingleValue(String key) async {
    String? value = await storage.read(key: key);
    return value;
  }

//Save value
  Future<void> saveValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

//Delete Value
  void deleteSingleValue(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAllValue() async {
    String language = await readSingleValue('language') ?? 'en';
    await storage.deleteAll();
    saveValue('language', language);
  }
}
