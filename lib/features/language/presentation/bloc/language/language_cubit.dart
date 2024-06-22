import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:hsu_bakery/services/storage.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final Storage storage;
  LanguageCubit(this.storage) : super(LanguageInitial());
  Map<String, String> _localizedStrings = {};

  void initializedLanguage() async {
    String lang = await storage.readSingleValue('language') ?? 'en';
    load(lang);
  }

  void changeLanguage(String changeLang) async {
    String? storeLang = await storage.readSingleValue('language');
    if (storeLang == null) {
      emit(LanguageLoadingState());
      await changeLanguageFunction(changeLang);
    } else {
      if (storeLang != changeLang) {
        emit(LanguageLoadingState());
        await changeLanguageFunction(changeLang);
      }
    }
  }

  Future<void> changeLanguageFunction(String changeLang) async {
    _localizedStrings = {};
    await storage.saveValue('language', changeLang);
    load(changeLang);
  }

  Future load(String lang) async {
    String jsonString = await rootBundle.loadString('lib/lang/$lang.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    emit(LanguageChangeSuccessState(lang));
  }

  String translate(String key) {
    return _localizedStrings[key] ?? "";
  }
}
