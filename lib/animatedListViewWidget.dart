import 'package:flutter/material.dart';
class AnimatedListView_Widget extends StatefulWidget {
  const AnimatedListView_Widget({super.key});

  @override
  State<AnimatedListView_Widget> createState() => _AnimatedListView_WidgetState();
}

class _AnimatedListView_WidgetState extends State<AnimatedListView_Widget> {
  final GlobalKey<AnimatedListState> _listKey=GlobalKey<AnimatedListState>();
 List<int> item=[];
 int count=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Animated ListView Widget"),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove),
            tooltip: 'Remove',
            onPressed: () {
              _listKey.currentState?.removeItem(0, (context, animation) => slideIT(animation, 0),
              duration: Duration(milliseconds: 500),
              );
              item.removeAt(0);
            },
          ),
        ],
        ),
      floatingActionButton: FloatingActionButton(onPressed: () {
  _listKey.currentState?.insertItem( 0,duration: Duration(milliseconds: 500));
  item=[]..add(count++)..addAll(item);

      },child: Icon(Icons.add)),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: item.length,
          itemBuilder: (context, index, animation) {
      return  slideIT(animation,index);
          },),
      ),
    );
  }
  Widget sizeIT(Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
    axis: Axis.vertical,
      child: Card(color: Colors.primaries[index % Colors.primaries.length],
          child: ListTile(title: Text("Item=${item[index]}"),)),
    );
  }
  Widget slideIT(Animation<double> animation, int index) {
    return SlideTransition(
      position: Tween<Offset>(
 begin: Offset(1, 1),
        end: Offset(0, 0)
      ).animate(animation),
      child: Card(color: Colors.primaries[index % Colors.primaries.length],
          child: ListTile(title: Text("Item=${item[index]}"),)),
    );
  }
}
