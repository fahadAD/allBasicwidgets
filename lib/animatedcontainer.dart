import 'dart:math';

import 'package:flutter/material.dart';
class Animatedcontainer extends StatefulWidget {
  const Animatedcontainer({super.key});

  @override
  State<Animatedcontainer> createState() => _AnimatedcontainerState();
}

class _AnimatedcontainerState extends State<Animatedcontainer> {
   double _hight=100;
   double _width=100;
   Color _color=Colors.yellow;
BorderRadiusGeometry _borderRadiusGeometry=BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated container"),),
      body: Center(
          child: AnimatedContainer(
            height: _hight,
            width: _width,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadiusGeometry,
              ),
               curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),

          )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        final random=Random();
        _hight=random.nextInt(300).toDouble();
        _width=random.nextInt(300).toDouble();
        _color=Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1);
        _borderRadiusGeometry=BorderRadius.circular(random.nextInt(100).toDouble());
        setState(() {

        });
      },child: Icon(Icons.refresh),),
    );
  }
}
