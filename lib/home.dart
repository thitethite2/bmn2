import 'package:flutter/material.dart';

List<Map> lm = [{'image':'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhOYLCAuwhTsipK5q8dOcLL1Wg_iHAsRwH7LzRHNsuWAXDUuqXbFgES_6wJh2n9Q8A5Lrrel4Aa2df5CnkocCNKhKLY17871QdNS5GcppPeoJi3C_GGVX_1suyfBhAWsUyMHjRFMjUd5yAJ/s0/x2.png'},{'image':'https://manhuahot.com/wp-content/uploads/2024/08/Clumsy-But-Adorable-175x238.jpg'},{'image':'https://manhuahot.com/wp-content/uploads/2024/08/Lost-Swan-Lake-175x238.jpg'},{'image':'https://manhuahot.com/wp-content/uploads/2022/11/Output1-175x238.jpg'},{'image':'https://manhuahot.com/wp-content/uploads/2024/04/Additional-Inheritance-175x238.jpg'}];



//ListView w = create_list(lm);


class Home extends StatelessWidget {
   const Home({super.key});
   static const double smallTextSize = 12.5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Theme.of(context).primaryColorLight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [

              //Black Hole
               const ListTile(

                 leading: Text('Black Hole',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                 trailing: Text('see more',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.blue,fontSize: smallTextSize),),
               ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: lm.length,
                   scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      return cardBulider(lm[index]['image']);
                    },
                  ),
                ),
                SizedBox(height: 20,),

                //Vooc
                const ListTile(
                  leading: Text('Vooc Translation',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                  trailing: Text('see more',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.blue,fontSize: smallTextSize),),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: lm.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      return cardBulider(lm[index]['image']);
                    },
                  ),
                ),

                //wave
                const ListTile(
                  leading: Text('Wave',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                  trailing: Text('see more',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.blue,fontSize: smallTextSize),),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: lm.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      return cardBulider(lm[index]['image']);
                    },
                  ),
                ),


              ],
            ),
          ),
        ),

    );
  }
}
Widget cardBulider(String im_link){
  return AspectRatio(
    aspectRatio: 2/3,
    child: Container(

      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(im_link),fit:BoxFit.fill),
        boxShadow:[
          BoxShadow(
          color: Colors.grey,
          offset: Offset(4.0,4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0

      ),
        BoxShadow(
            offset: Offset(-4.0,-4.0),
            color: Colors.white,
            blurRadius: 15.0,
            spreadRadius: 1.0
        )
        ]
      ),
    ),
  );
}
