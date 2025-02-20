import 'package:bmn_flutter/script/info_navigator.dart';
import 'package:flutter/material.dart';

Widget cardBulider({required String manhuaId,required BuildContext context,required String imLink}) {
  return AspectRatio(
    aspectRatio: 2 / 3,
    child: GestureDetector(
      onTap: ()=>{
        Infonavigator(context,manhuaId)}
      ,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: NetworkImage(imLink), fit: BoxFit.fill),
        ),
      ),
    ),
  );
}
