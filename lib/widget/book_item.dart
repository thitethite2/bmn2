import 'package:bmn_flutter/info.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key,required this.image,required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Info(book_id: title)));
        },
        child: Card(
            elevation: 5,
            color: Colors.grey[400],
            child: Row(
              children: [
                Container(
                  child: Image(image: NetworkImage(image ),fit:BoxFit.fill),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  width: 120,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],

                  ),

                ),
                 Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Latest Chapter'),
                            Text('128',style: TextStyle(fontStyle: FontStyle.italic)),
                          ],
                        ),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Status'),
                            Text('Ongoing',style: TextStyle(fontStyle: FontStyle.italic)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
