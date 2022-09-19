import 'package:flutter/cupertino.dart';

class LanguageProvider with ChangeNotifier {   
  Locale _currentLocale = new Locale('en');

  Locale get currentLocale => _currentLocale;


  void changeLocale(String _locale) {
    this._currentLocale = new Locale(_locale);
    notifyListeners();
  }

 bool isArabic(){
    if(currentLocale == const Locale('ar')){
    return true;
    }else {
    return false;
    }
  }

}
