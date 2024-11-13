import 'package:flutter/material.dart';
class CoinLabelText extends StatelessWidget {
  final String  text;
   const CoinLabelText({super.key,required this.text});


  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(
      color: Theme.of(context).primaryColorLight,
      fontWeight: FontWeight.bold,

    ),);
  }
}

class CoinText extends StatelessWidget {
  final String text;
  const CoinText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }
}

