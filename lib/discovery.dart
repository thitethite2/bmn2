import 'package:bmn_flutter/widget/book_item.dart';
import 'package:flutter/material.dart';




class Discovery extends StatelessWidget {
  final String channel_name;
  Discovery({super.key,required this.channel_name});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(this.channel_name),
        
      ),

      body: MyGrid()

    );
  }
}


class MyGrid extends StatelessWidget{
  MyGrid({super.key});
  final String image = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhOYLCAuwhTsipK5q8dOcLL1Wg_iHAsRwH7LzRHNsuWAXDUuqXbFgES_6wJh2n9Q8A5Lrrel4Aa2df5CnkocCNKhKLY17871QdNS5GcppPeoJi3C_GGVX_1suyfBhAWsUyMHjRFMjUd5yAJ/s0/x2.png";

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top:3,right: 2,left: 2,bottom: 3),
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context,index){

            return BookItem(image: image, title: 'How to be the chosen One');
         }

      ),
    );
  }
}
