import 'package:bmn_flutter/widget/coins_view.dart';
import 'package:flutter/material.dart';
class Coin extends StatefulWidget {
  const Coin({super.key});

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.only(left:10.0,right: 10.0),
          child: Row(

              children: [
                CoinsView(value: '3600', label: 'Paid Coin'),
                SizedBox(width: 10,),
                CoinsView(value: '2334', label: 'Free Coin')

              ],
            ),
        ),

      ],
    ),);
  }
}
