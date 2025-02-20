import 'package:flutter/material.dart';

import '../info.dart';

void Infonavigator (BuildContext context,String manhuaId){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Info(book_id: manhuaId)));

}