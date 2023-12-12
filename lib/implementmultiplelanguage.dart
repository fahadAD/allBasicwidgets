import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'Controller/languagechange_provider.dart';
class Implementmultiplelanguage extends StatefulWidget {
  const Implementmultiplelanguage({super.key});

  @override
  State<Implementmultiplelanguage> createState() => _ImplementmultiplelanguageState();
}
enum Language{english, spanish}
class _ImplementmultiplelanguageState extends State<Implementmultiplelanguage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.helloworld),
      actions: [
        Consumer<LanguageChangeNotiferProvider>(builder: (context, provider, child) {
          return PopupMenuButton(
            onSelected: (Language value) {
              if(Language.english.name == value.name){
                 provider.changeLanguage(Locale("en"));
              }else{
                provider.changeLanguage(Locale("es"));
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<Language>>[
              PopupMenuItem(
                  value: Language.english,
                  child: Text("English")),
              PopupMenuItem(
                  value: Language.spanish,
                  child: Text("Spanish")),
            ],);
        },)
       ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
               // InteractiveViewer(
               //
               //   child: Image.asset("images/avarest.jpg",
               //   width: double.infinity,
               //
               //     // fit: BoxFit.fill,
               //   ),
               // ),
               SizedBox(height: 10,),
               InteractiveViewer(
                 minScale: 1,
                 maxScale: 10,
                 child: Image.asset("images/dfg.jpg",
                 width: double.infinity,

                   // fit: BoxFit.fill,
                 ),
               ),

          ],
        ),
      ),
    );
  }
}
