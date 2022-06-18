import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences _preferences;
  LanguageCubit(this._preferences)
      : super(SelectedLocale(Locale(_preferences.getString('locale') ?? 'en')));
  static LanguageCubit get(context) => BlocProvider.of(context);

  void toArabic() => emit(const SelectedLocale(Locale('ar')));

  void toEnglish() => emit(const SelectedLocale(Locale('en')));

  void changeLocale(String locale) {
    _preferences.setString('locale', locale);
    emit(SelectedLocale(Locale(locale)));
  }

  void changelang(context) async {
    if (AppLocalizations.of(context)!.localeName == 'en') {
      changeLocale('ar');
      LanguageCubit.get(context).toArabic();
    } else {
      changeLocale('en');
      LanguageCubit.get(context).toEnglish();
    }
  }
}
