import 'package:bmn_flutter/widget/book_item.dart';
import 'package:flutter/material.dart';




class Discovery extends StatelessWidget {
  final String channel_name;
  Discovery({super.key,required this.channel_name});


  @override
  Widget build(BuildContext context) {
    return  MyGrid();
  }
}


class MyGrid extends StatelessWidget{
  MyGrid({super.key});
  final String image = "https://manhuahot.com/wp-content/uploads/2024/04/Additional-Inheritance-175x238.jpg";
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top:3,right: 2,left: 2,bottom: 3),
      color: Colors.grey[350],
      child: ListView.builder(
          itemCount: 100,
          clipBehavior: Clip.hardEdge,
          itemBuilder: (context,index){

            return BookItem(image: image, title: 'How to be the chosen One');
         }

      ),
    );
  }
}
