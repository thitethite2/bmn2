import 'package:flutter/material.dart';




class Discovery extends StatelessWidget {
  final String channel_name;
  Discovery({super.key,required this.channel_name});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).highlightColor,),
      body: MyGrid()

    );
  }
}


class MyGrid extends StatelessWidget{
  MyGrid({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top:3,right: 2,left: 2,bottom: 3),
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
       crossAxisCount: 3,
        children: List.generate(100,(index){
          return Placeholder();
        }),
      ),
    );
  }
}
