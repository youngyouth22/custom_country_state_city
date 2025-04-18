import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CountryStateCityLocalizations {
  final Locale locale;
  CountryStateCityLocalizations(this.locale);

  static CountryStateCityLocalizations? of(BuildContext context) {
    return Localizations.of<CountryStateCityLocalizations>(
        context, CountryStateCityLocalizations);
  }

  static LocalizationsDelegate<CountryStateCityLocalizations> delegate =
      const _CountryPickerLocalizationDelegate();
  late Map<String, String> _localizedStrings;
  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
        'package:custom_country_state_city/localization/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? translate(String? key) {
    return _localizedStrings[key];
  }
}

class _CountryPickerLocalizationDelegate
    extends LocalizationsDelegate<CountryStateCityLocalizations> {
  const _CountryPickerLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return [
      "af",
      "am",
      "ar",
      "az",
      "be",
      "bg",
      "bn",
      "bs",
      "ca",
      "cs",
      "da",
      "de",
      "el",
      "en",
      "es",
      "et",
      "fa",
      "fi",
      "fr",
      "gl",
      "ha",
      "he",
      "hi",
      "hr",
      "hu",
      "hy",
      "id",
      "is",
      "it",
      "ja",
      "ka",
      "kk",
      "km",
      "ko",
      "ku",
      "ky",
      "lt",
      "lv",
      "mk",
      "ml",
      "mn",
      "ms",
      "nb",
      "nl",
      "nn",
      "no",
      "pl",
      "ps",
      "pt",
      "ro",
      "ru",
      "sd",
      "sk",
      "sl",
      "so",
      "sq",
      "sr",
      "sv",
      "ta",
      "tg",
      "th",
      "tk",
      "tr",
      "tt",
      "uk",
      "ug",
      "ur",
      "uz",
      "vi",
      "zh",
    ].contains(locale.languageCode);
  }

  @override
  Future<CountryStateCityLocalizations> load(Locale locale) async {
    CountryStateCityLocalizations localizations =
        CountryStateCityLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_CountryPickerLocalizationDelegate old) {
    return false;
  }
}
