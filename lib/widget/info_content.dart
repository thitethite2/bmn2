import 'package:flutter/material.dart';

class InfoContent extends StatelessWidget {
  final String preview_image;
  final String description;
  final String title;

  const InfoContent(
      {
        super.key,
        required this.preview_image,
        required this.description,
        required this.title,

      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image(
            image: NetworkImage(preview_image),
            width: 300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              fontSize: 20),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            description,
            style: const TextStyle(

                fontWeight: FontWeight.w800,
                fontSize: 12),
          ),
        ),


      ],
    );
  }
}
