import 'package:flutter/material.dart';
class Reorderable_ListView  extends StatefulWidget {
  const Reorderable_ListView ({super.key});

  @override
  State<Reorderable_ListView> createState() => _Reorderable_ListViewState();
}

class _Reorderable_ListViewState extends State<Reorderable_ListView> {
  List<String> _products=["mango","apple","banana","avacado","orange"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("ReorderableListView ")),
    body: ReorderableListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
           return Card(
             key: ValueKey(_products[index]),
             child: ListTile(

               title: Text(_products[index]),
             ),
           );
        },
      onReorder: (oldIndex, newIndex) {
      setState(() {
       if(newIndex > oldIndex){
         newIndex--;
       }
      });
     final element=_products.removeAt(oldIndex);
     _products.insert(newIndex, element);
      },
    ),
    );
  }
}
