import 'dart:convert';

import 'package:bmn_flutter/config.dart';
import 'package:bmn_flutter/script/chapter_views_bulider.dart';
import 'package:bmn_flutter/widget/info_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'models/manhua.dart';

String manhuaId = "";
List<Map<String,String>> chapters = [
  {'name':"chapter 1",'count' : '1'},
  {'name':"chapter 2",'count' : '2'},
  {'name':"chapter 3",'count' : '3'},
  {'name':"chapter 4",'count' : '4'},
  {'name':"chapter 5",'count' : '5'},
];



class Info extends StatelessWidget {
  final String book_id;
  Info({super.key,required this.book_id});







  @override
  Widget build(BuildContext context) {
    manhuaId = book_id;

    return  Scaffold(
      appBar: AppBar(title: const Text('Info'),),
      body: InfoBody()
    );
  }
}


class InfoBody extends StatefulWidget {



  @override
  State<InfoBody> createState() => _InfoBodyState();
}

class _InfoBodyState extends State<InfoBody> {



  late Future<Manhua?> manhua ;
  late Future<List<Chapter>> chapters;
  String api = "${Myapp.content_api}manhua/${manhuaId}";
  String chapters_api = "${Myapp.content_api}manhua/${manhuaId}/chapters";
  @override
  void initState(){
     super.initState();
     manhua = fetchManhua();
     chapters = fetchChapters();
  }

  Future<List<Chapter>> fetchChapters() async{
       final response = await http.get(Uri.parse(chapters_api));
       if (response.statusCode == 200){
         List<dynamic> json = jsonDecode(response.body);
         return json.map((data) => Chapter.fromJson(data)).toList();
       } else{

             throw Exception('Failler to Load chapters');

       }
  }

  Future<Manhua?> fetchManhua() async{
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(response.body);
      return Manhua.fromJson(json);

    }
    else{
      throw Exception('failed to load manhua');
    }

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:SingleChildScrollView(
        child: Padding(

          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: manhua,
                  builder: (context,snapshot){
                    if (snapshot.hasData){
                      Manhua? manhua = snapshot.data;
                      return InfoContent(
                          preview_image:manhua!.previewImage,
                          description: manhua!.description,
                          title: manhua!.title);
                    } else if (snapshot.hasError){
                      return  Text("some error on the snapshot ${snapshot.error.toString()}");
                    }
                    return const Center(
                      child:  CircularProgressIndicator(),
                    );


                }
              ),

              //chapters view
              FutureBuilder(
                  future: chapters,
                  builder: (context,snapshot) {
                    if(snapshot.hasData){
                      //return
                    }
                  }
              )

            ],
          ),
        ),
      )

    );
  }
}

