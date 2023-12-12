import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class LanguageChangeNotiferProvider with ChangeNotifier{
 Locale? _appLocale;
Locale? get applocale => _appLocale;

Future<void> changeLanguage(Locale type) async {
SharedPreferences sp=await SharedPreferences.getInstance();
_appLocale=type;
if(type==Locale("en")){

await sp.setString("language_code", "en");
}else{
  await sp.setString("language_code", "es");
}
notifyListeners();
}
}



