import '../../../../app_route.dart';
import '../../../../businesslogic/Auth_cubit/auth_cubit.dart';
import '../../../../businesslogic/home_cubit/home_cubit.dart';
import '../../../../businesslogic/lang_cubit/language_cubit.dart';
import '../../../../businesslogic/map_cubit/map_cubit.dart';
import '../../../../businesslogic/product_cubit/product_cubit.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pref = await SharedPreferences.getInstance();
  BlocOverrides.runZoned(
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
            BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
            BlocProvider<MapCubit>(create: (context) => MapCubit()),
            BlocProvider<ProductCubit>(create: (context) => ProductCubit()),
            BlocProvider<LanguageCubit>(
                create: (context) => LanguageCubit(pref)),
          ],
          child: App(preferences: pref),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class App extends StatelessWidget {
  final SharedPreferences preferences;
  static late BuildContext appContext;
  static late AppLocalizations tr;
  const App({Key? key, required this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _systemOverLay();

    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => LanguageCubit(preferences),
        child: BlocConsumer<LanguageCubit, LanguageState>(
          listener: (context, state) {},
          buildWhen: (previousState, currentState) =>
              previousState != currentState,
          builder: (context, state) {
            return MaterialApp(
              onGenerateTitle: (context) {
                appContext = context;
                tr = AppLocalizations.of(context)!;
                return tr.aboutUs;
              },
              localeResolutionCallback: localization,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.locale,
              theme: _themeData(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        ),
      );
    });
  }

  void _systemOverLay() {
    return SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark // status bar color
        ));
  }

  Locale? localization(
    locale,
    supportedLocales,
  ) {
    for (var supportedLocaleLanguage in supportedLocales) {
      if (supportedLocaleLanguage.languageCode == locale?.languageCode &&
          supportedLocaleLanguage.countryCode == locale?.countryCode) {
        return supportedLocaleLanguage;
      }
    }
    return supportedLocales.first;
  }

  ThemeData _themeData() {
    return ThemeData(
        fontFamily: Resurces.mainfont,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: _appBarTheme());
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
        toolbarHeight: 8.h,
        elevation: 0,
        titleSpacing: 0,
        color: Colors.white,
        iconTheme: const IconThemeData(
          color: MyColors.primarColor,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark // status bar color
            ));
  }
}
