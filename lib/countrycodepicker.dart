import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
class CountrycodePicker extends StatefulWidget {
  const CountrycodePicker({super.key});

  @override
  State<CountrycodePicker> createState() => _CountrycodePickerState();
}

class _CountrycodePickerState extends State<CountrycodePicker> {




  String _countryCode="";
  String _phoneCode="";
  String _name="";
  String _displayname="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Country code Picker"),),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.ph,
          Text(_countryCode,style: TextStyle(fontWeight: FontWeight.bold),),
          10.ph,
          Text(_phoneCode,style: TextStyle(fontWeight: FontWeight.bold),),
           10.ph,
           Text(_name,style: TextStyle(fontWeight: FontWeight.bold),),
           10.ph,
           Text(_displayname,style: TextStyle(fontWeight: FontWeight.bold),),
          30.ph,

          Center(
            child: ElevatedButton(onPressed: () {
            showCountryPicker(context: context,
              countryListTheme:  CountryListThemeData(
                inputDecoration: InputDecoration(
                  hintText: "Selected Country",
                  labelText: "Country"
                )
              ),
              onSelect: (value) {
                      print(value.countryCode);
                      print(value.phoneCode);
                      print(value.name);
                      print(value.displayName);
                      print(value.displayNameNoCountryCode);
                      print(value.e164Key);
                      print(value.example);
                      print(value.fullExampleWithPlusSign);
                      print(value.geographic);
                      print(value.nameLocalized);
                      print(value.e164Sc);
                      print(value.level.toString());



            setState(() {
              _countryCode="Country Code : "+value.countryCode;
              _phoneCode="Phone Code : "+value.phoneCode;
              _name="Name : "+value.name;
              _displayname="Country Code with country name  : "+value.displayName;
            });
            },);

            }, child: Text("Tap")),
          )

        ],
      ),
    );
  }

}
//dynamic size box

extension padding on num{
  SizedBox get ph=>SizedBox(height: toDouble() ,);
  SizedBox get pw=>SizedBox(width: toDouble() ,);
}