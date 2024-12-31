import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String book_id;
  final String url = 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhOYLCAuwhTsipK5q8dOcLL1Wg_iHAsRwH7LzRHNsuWAXDUuqXbFgES_6wJh2n9Q8A5Lrrel4Aa2df5CnkocCNKhKLY17871QdNS5GcppPeoJi3C_GGVX_1suyfBhAWsUyMHjRFMjUd5yAJ/s0/x2.png';
  const Info({super.key,required this.book_id});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image(
                image: NetworkImage(url),
                width: 300,

                  ),
            ),
            const Text(
                'How to Be the chosen one',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),
            )
          ],
        ),
      ),
    );
  }
}
