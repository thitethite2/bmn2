import 'package:bmn_flutter/widget/heading_bulider.dart';
import 'package:flutter/material.dart';

import 'discovery.dart';

List<Map> lm = [{'image':'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhOYLCAuwhTsipK5q8dOcLL1Wg_iHAsRwH7LzRHNsuWAXDUuqXbFgES_6wJh2n9Q8A5Lrrel4Aa2df5CnkocCNKhKLY17871QdNS5GcppPeoJi3C_GGVX_1suyfBhAWsUyMHjRFMjUd5yAJ/s0/x2.png'},{'image':'https://manhuahot.com/wp-content/uploads/2024/08/Clumsy-But-Adorable-175x238.jpg'},{'image':'https://manhuahot.com/wp-content/uploads/2024/08/Lost-Swan-Lake-175x238.jpg'},{'image':'https://manhuahot.com/wp-content/uploads/2022/11/Output1-175x238.jpg'},{'image':'https://manhuahot.com/wp-content/uploads/2024/04/Additional-Inheritance-175x238.jpg'}];





class Home extends StatelessWidget {
   const Home({super.key});

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
                HeadingBulider(channel_name: 'Black Hole', mcontext: context,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: lm.length,
                   scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      return cardBulider(lm[index]['image']);
                    },
                  ),
                ),
                const SizedBox(height: 20,),

                //Vooc
              HeadingBulider(channel_name: 'Vooc Translation', mcontext: context,),

                SizedBox(
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
                HeadingBulider(channel_name: 'Wave', mcontext: context,),

                SizedBox(
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


Widget cardBulider(String imLink){
  return AspectRatio(
    aspectRatio: 2/3,
    child: Container(

      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border:Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(image: NetworkImage(imLink),fit:BoxFit.fill),
        
      ),
    ),
  );
}
