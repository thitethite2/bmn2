import 'package:bmn_flutter/widget/home_content.dart';
import 'package:flutter/material.dart';








class Home extends StatelessWidget {
   const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Theme.of(context).primaryColorLight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeContent(),
          ),
        ),

    );
  }
}



