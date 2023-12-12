
import 'package:allbasicwidgets/reorderableListView.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controller/languagechange_provider.dart';
import 'animatedListViewWidget.dart';
import 'animatedcontainer.dart';
import 'checkInternetConnectivity.dart';
import 'countrycodepicker.dart';
import 'imagepickerWidgets.dart';
import 'implementmultiplelanguage.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp=await SharedPreferences.getInstance();
final String languagecode=sp.getString("language_code")??"";
  runApp( MyApp(locale: languagecode,));
}
class MyApp extends StatefulWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(providers: [

      ChangeNotifierProvider(create: (context) => LanguageChangeNotiferProvider(),),
    ],child: Consumer<LanguageChangeNotiferProvider>(builder: (context, value, child) {
      if(widget.locale.isEmpty){
        value.changeLanguage(Locale("en"));
      }
      return MaterialApp(
        locale:widget.locale==""?Locale("en") : value.applocale ==null ? Locale("en") : value.applocale,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("en"),
          Locale("es"),
        ],
        debugShowCheckedModeBanner: false,
        // home: CountrycodePicker(),
        // home: Reorderable_ListView(),
        // home: Animatedcontainer(),
        // home: CheckInternetConnectivity(),
        // home: AnimatedListView_Widget(),
        // home: ImagepickerWidgets(),
        // home: Implementmultiplelanguage(),
        home: CheckInternetConnectivity(),
        builder: EasyLoading.init(),
       );
    },),);
  }
}