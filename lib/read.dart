import 'dart:convert';
import 'dart:io';

import 'package:bmn_flutter/info.dart';
import 'package:bmn_flutter/script/get_chapter_images.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'config.dart';
import 'package:http/http.dart' as http;



class Read extends StatefulWidget {
  Read({super.key, required this.name, required this.manhuaId, required this.chapterId});
  final String name;
  final String manhuaId;
  final String chapterId;


  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  late Future<List<dynamic>> futureImages ;
  @override
  void initState() {
    String api = "${Myapp.content_api}manhua/${widget.manhuaId}/chapters/${widget.chapterId}";
    futureImages = fetchImages(api);
    print(api);
    super.initState();
  }

  Future<List<dynamic>> fetchImages (String api) async{
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      return data;
    }else{
      throw Exception('Failled to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),

      ),
      body: Container(
        color: Colors.grey[600],
        child:FutureBuilder <List<dynamic>>(
          future: futureImages,
          builder: (context,snapshot){

            if (snapshot.hasData){
              List<dynamic> _images = snapshot.data!;
              return  ListView.builder(
                  itemCount: _images.length,
                  itemBuilder: (context,index){
                    return ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 200,

                      ),
                      child: FadeInImage.memoryNetwork(
                        image: _images[index],
                        placeholder: kTransparentImage,



                      ),
                    );

                  });
            } else if(snapshot.hasError){
              return Text('snapshot has error ${snapshot.error}');

            }
            return Center(child: CircularProgressIndicator(),);



          },
        )
      )
    );
  }
}