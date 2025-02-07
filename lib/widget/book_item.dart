import 'package:bmn_flutter/info.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

class BookItem extends StatelessWidget {

  const BookItem({
    super.key,
    required this.status,
    required this.image,
    required this.title,
    required this.latestChapter,
    required this.manhuaId,

  });
  final String image;
  final String title;
  final String status;
  final String latestChapter;
  final String manhuaId;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Info(book_id: manhuaId)));
        },
        child: Container(
           margin: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
            width: 100,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),

                boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(6, 6),
                  spreadRadius: 1,
                  blurRadius: 5.0
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-3, -3),
                  spreadRadius: 1.5,
                  blurRadius: 5.0
                )
              ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(

                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  child: Image(
                      image: NetworkImage(image,),
                      fit:BoxFit.fill,
                    width: 120,
                    height:  170,
                    errorBuilder:(BuildContext context ,Object error, StackTrace? stackTrace){
                        return SvgPicture.asset(
                        'assets/images/bannerPlaceholder.svg',
                          width:120,
                          height: 170,
                          fit: BoxFit.cover,
                        );

                    },


                  ),

                ),
                 Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Latest Chapter',style: TextStyle(fontSize: 10),),
                            Text(latestChapter,style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 10)),
                          ],
                        ),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Status',style: TextStyle(fontSize: 10),),
                            Text(status,style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 10)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      );

  }
}
