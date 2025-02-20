import 'package:flutter/material.dart';

import '../discovery.dart';

class HeadingBulider extends StatelessWidget {
  const HeadingBulider({super.key,required this.channel_name,required this.mcontext});
  static const double smallTextSize = 12.5;
  final String channel_name;
  final BuildContext mcontext;
  void seeMore(String channel,BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Discovery(channel_name: channel))
    );
  }


  @override
  Widget build(BuildContext context) {
    return  ListTile(

      leading: Text(channel_name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
      trailing: GestureDetector(
          onTap: () {
           seeMore(channel_name, mcontext);
          },
          child: Text(
            'see more',
            style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.blue,fontSize: smallTextSize),
          )
      ),
    );
  }
}
