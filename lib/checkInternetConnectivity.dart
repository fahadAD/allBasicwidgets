import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class CheckInternetConnectivity extends StatefulWidget {
  const CheckInternetConnectivity({super.key});

  @override
  State<CheckInternetConnectivity> createState() => _CheckInternetConnectivityState();
}

class _CheckInternetConnectivityState extends State<CheckInternetConnectivity> {

  Future exitDialog()async{
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Exit!!"),
        content: Text("do you want to exit"),
        actions: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("No")),
          ElevatedButton(onPressed: () {

SystemNavigator.pop();
          }, child: Text("Yes")),

        ],
      );
    },);
  }

  StreamSubscription? streamSubscription;

  Future checkConnection()async{
    var  connectivityResult=await Connectivity().checkConnectivity();
    if(connectivityResult==ConnectivityResult.mobile){
      EasyLoading.showSuccess("Connect with mobile");
      print("Connect with mobile");
    }else if(connectivityResult==ConnectivityResult.wifi){
      EasyLoading.showSuccess("Connect with wifi");
      print("Connect with wifi");
    }else{
      EasyLoading.showToast("Not Connected");
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Not Connected!!"),
          content: Text("Please connected device your internet then again Entry"),
          actions: [
            WillPopScope(
              onWillPop: () {
                exitDialog();
                return Future.value(false);
              },
              child: ElevatedButton(onPressed: () {

                   SystemNavigator.pop();
              }, child: Text("ok")),
            ),

          ],
        );
      },);
      print("Not Connected");
    }}

  @override
  void initState() {
    streamSubscription=Connectivity().onConnectivityChanged.listen((event) {checkConnection();});
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
     streamSubscription?.cancel();
  }
  @override
  Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          exitDialog();
          return Future.value(false);
        },
        child: Scaffold(

            //   appBar: AppBar(title: Text("Check Internet Connectivity")),
            // floatingActionButton: FloatingActionButton(onPressed: () {
            //   checkConnection();
            // },child: Text("Check")),
            //
            ),
      );
  }
}
