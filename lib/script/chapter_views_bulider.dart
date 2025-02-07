import 'package:bmn_flutter/read.dart';
import 'package:flutter/material.dart';

class ChapterViewsBulider {

  static List<Widget> build_list (List<Map<String,String>> from,BuildContext context){
    List<Widget> lm = [];
    for (int i=0;i<from.length;i++){
      lm.add(
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Read(name: from[i]['name'] ?? 'Null Chapter name')));

              },
            child: Card(
              child: ListTile(
                title: Text(from[i]['name'] ?? 'Chapter name not found'),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      Text(from[i]['count'] ?? 'Null'),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
            ),
          )
      );
    }


      return lm;
  }
}





