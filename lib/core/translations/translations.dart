import 'package:annale_driver/core/translations/fr_FR.dart';
import 'package:annale_driver/core/translations/ht_HT.dart';
import 'package:get/get.dart';
import 'en_US.dart';
import 'es_ES.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'es_ES': esES,
    'ht_HT': htHT,
    'fr_FR': frFR,
  };
}
