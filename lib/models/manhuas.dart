import 'package:flutter/foundation.dart';

class Manhuas{
  final String title;
  final String bannerImage;
 // final String latestChapter;
  final String translator;
  final String publishDate;
  final String status;
  final String latestChapter;
  final String manhuaId;


  Manhuas({
    required this.title,
    required this.bannerImage,
  //  required this.latestChapter,
    required this.translator,
    required this.publishDate,
    required this.status,
    required this.latestChapter,
    required this.manhuaId
  });

  factory Manhuas.fromJson(Map<String,dynamic> json){
    return Manhuas(
      title: json['title'],
      bannerImage: json['bannerImage'] ?? 'invalid image link',
     // latestChapter: json['latestChapter'],
      translator: json['translator'],
      publishDate: json['publishDate'],


      status: json['status']??  'unknown status',
     latestChapter: json['latestChapter'] ?? 'unknown latest chapter',
        manhuaId:json['manhuaId'] ?? 'invalid manhua id'

    );
  }


}