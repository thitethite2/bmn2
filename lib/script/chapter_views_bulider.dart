import 'package:bmn_flutter/models/manhua.dart';
import 'package:bmn_flutter/read.dart';
import 'package:flutter/material.dart';

class ChapterViewsBulider {
  static List<Widget> build_list(List<Chapter> from, BuildContext context,{required String manhuaId}) {
    List<Widget> lm = [];
    for (int i = 0; i < from.length; i++) {
      lm.add(GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Read(
                      name: from[i].title,
                      chapterId: from[i].chapterId,
                      manhuaId: manhuaId)));
        },
        child: Card(
          child: ListTile(
            title: Text(from[i].title ),
            trailing: Container(
              width: 50,
              child: Row(
                children: [
                  Text(from[i].count),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
          ),
        ),
      ));
    }

    return lm;
  }
}
