import 'dart:convert';

import 'package:bmn_flutter/config.dart';
import 'package:bmn_flutter/widget/book_item.dart';
import 'package:flutter/material.dart';

import 'models/manhuas.dart';
import 'package:http/http.dart' as http;



class Discovery extends StatelessWidget {
  final String channel_name;
  Discovery({super.key,required this.channel_name});

  @override
  Widget build(BuildContext context) {
    return  MyGrid(title: channel_name,);
  }
}



class MyGrid extends StatefulWidget {
  const MyGrid({super.key,required this.title});
  final String title;

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {

  String api = "${Myapp.content_api}manhua";

  late Future<List<Manhuas>> futureManhuas;

  @override
  void initState(){
    super.initState();
    futureManhuas = fetchManhuas();
  }

  Future<List<Manhuas>> fetchManhuas() async {

    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200){
      List<dynamic> data  = json.decode(response.body);
      return data.map((json) => Manhuas.fromJson(json)).toList();
    }
    else{
      throw Exception('Failler to Load manhuas');
    }

  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Container(
        padding: EdgeInsets.only(top:3,right: 2,left: 2,bottom: 3),
        color: Colors.grey[350],
        child: FutureBuilder<List<Manhuas>>(

          future: futureManhuas,
          builder: (context,snapshot) {
            if (snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  clipBehavior: Clip.hardEdge,
                  itemBuilder: (context,index){

                    Manhuas manhua = snapshot.data![index];

                    return BookItem(
                        image: manhua.bannerImage,
                        title: manhua.title,
                      status: manhua.status,
                      latestChapter: manhua.latestChapter,
                      manhuaId: manhua.manhuaId,
                    );
                  }

              );
            }
            else if (snapshot.hasError){

              return Text("some error of res ${snapshot.error}");

            }

           return CircularProgressIndicator();

          },

        )


        /* ,*/
      ),
    );
  }
}
