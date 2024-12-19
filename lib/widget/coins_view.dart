import 'package:flutter/material.dart';
class CoinsView extends StatelessWidget {
  final String value;
  final String label;
  const CoinsView({super.key,required this.value,required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).highlightColor,


            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(value,style: const TextStyle(color: Colors.white,fontSize: 18),),
                Text(label,style: TextStyle(color: Colors.blueGrey[200],fontSize: 10)),

              ],
            ))
    );
  }
}
