import 'package:bmn_flutter/info.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key,required this.image,required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Info(book_id: title)));
        },
        child: Container(
           margin: EdgeInsets.only(left: 30,right: 30,bottom: 40),
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

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  child: Image(
                      image: NetworkImage(image, ),
                      fit:BoxFit.fill,
                    width: 120,


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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Latest Chapter',style: TextStyle(fontSize: 10),),
                            Text('128',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10)),
                          ],
                        ),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Status',style: TextStyle(fontSize: 10),),
                            Text('Ongoing',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10)),
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
