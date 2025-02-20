

import 'manhuas.dart';

class Manhua extends Manhuas {
  final String description;
  final String previewImage;

  Manhua(
      {required super.title,
      required super.bannerImage,
      required super.translator,
      required super.publishDate,
      required super.status,
      required super.latestChapter,
      required super.manhuaId,
      required this.description,
      required this.previewImage});

  factory Manhua.fromJson(Map<String,dynamic> json){
    return Manhua(
        title: json['title'],
        bannerImage: json['bannerImage'] ?? 'invalid image link',
        // latestChapter: json['latestChapter'],
        translator: json['translator'],
        publishDate: json['publishDate'],


        status: json['status']??  'unknown status',
        latestChapter: json['latestChapter'] ?? 'unknown latest chapter',
        manhuaId:json['manhuaId'] ?? 'invalid manhua id',
        description: json['description'],
        previewImage: json['previewImage'],


    );
  }
}

class Chapter {
  final String title;
  final String count;
  final String chapterId;
  Chapter({required this.title,required this.chapterId,required this.count});

  factory Chapter.fromJson(Map<String,dynamic> json){
    return Chapter(title : json['title'], count:json['count'],chapterId: json['chapterId']);
  }



}


