import 'package:news/l10n/app_localizations.dart';

class LanguageModel {
  final String code;
  LanguageModel(this.code);

  static List<LanguageModel> languages = [
    LanguageModel('en'),
    LanguageModel('ar'),
  ];

  String getLanguage(AppLocalizations appLocalizations) {
    switch (code) {
      case 'en':
        return appLocalizations.english;
      case 'ar':
        return appLocalizations.arabic;
      default:
        return code;
    }
  }
}
