import 'dart:convert';

import 'package:bmn_flutter/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'card_bulider.dart';
import 'heading_bulider.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late Future<Map<String, dynamic>> publishers;
  final String api = "${Myapp.content_api}manhua/home";
  @override
  void initState() {
    // TODO: implement initState
    publishers = fetchPublishers();
    super.initState();
  }

  Future<Map<String, dynamic>> fetchPublishers() async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception('Failled to load home page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: publishers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String,dynamic> data = snapshot.data!;
            //body is the variable for content widgets
            List<Widget> body = [];
            data.forEach((key, value) {
              body.add(HeadingBulider(
                  channel_name: key, mcontext: context));
              body.add(SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: data[key].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return cardBulider(manhuaId: data[key][index]['manhuaId'], context: context, imLink: data[key][index]['bannerImage']);
                  },
                ),
              ));
              body.add(const SizedBox(
                height: 20,
              ));
            });

            return Column(
              children: body,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
