import 'dart:convert';
import 'dart:io';

import 'package:bmn_flutter/script/get_chapter_images.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';



class Read extends StatelessWidget {
  Read({super.key, required this.name});
  final String name;
  final List<String> images = [
    "https://lh3.googleusercontent.com/-08rTdiZicaQ/Z4KGRx7eNjI/AAAAAAAAWpI/IJoBBplqHMAOmYWs8NvC-n0EXwnmuOxsQCNcBGAsYHQ/s1600-rw/7c40554a185a09f02535ade680e24dd8.jpg",
    "https://lh3.googleusercontent.com/-yKNzo9AOT6E/Z4KGTDJE-8I/AAAAAAAAWpM/eb0mWbs3BWwyr7nFVFDVuWBUFq6YpGorwCNcBGAsYHQ/s1600-rw/Picsart_25-01-07_12-58-36-289.jpg",
    "https://lh3.googleusercontent.com/-Jvdc3B_reg8/Z4KGUujnibI/AAAAAAAAWpQ/2uw-FDjl2dcQeUHQ7doYSl8IPLRxs6wUQCNcBGAsYHQ/s1600-rw/Picsart_25-01-07_13-08-32-066.jpg",
    "https://lh3.googleusercontent.com/-GHZk9X0UcLs/Z4KGV1kaebI/AAAAAAAAWpU/Ow6qwe-DRoIurPkjkSh_MG7tSemQPwAmACNcBGAsYHQ/s1600-rw/Picsart_25-01-07_13-10-16-012.jpg",
    "https://lh3.googleusercontent.com/-AXTIyn2k2_o/Z4KGXKl6THI/AAAAAAAAWpY/bWG3SCWEju0mmUBSkd3Que4QW1vLZV1TgCNcBGAsYHQ/s1600-rw/Picsart_25-01-07_13-13-11-388.jpg",
    "https://lh3.googleusercontent.com/-111AFQZ82Lk/Z4KGYXzVSXI/AAAAAAAAWpc/lkyXaWqpI-gyhmnmdLiMkrdz9OjEK4WaQCNcBGAsYHQ/s1600-rw/Picsart_25-01-07_13-36-57-750.jpg",
    "https://lh3.googleusercontent.com/-gZ6ii-d3HYE/Z4KGZkmDSvI/AAAAAAAAWpg/6_sxyn6eBc0qMcjAUa4_Cftojv7uUEiPgCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_20-49-39-102.jpg",
    "https://lh3.googleusercontent.com/-889BjXi7Ypw/Z4KGa6hZylI/AAAAAAAAWpk/Mg21gjXHtLo1LKzjhbu6CmOIqczXwaM-ACNcBGAsYHQ/s1600-rw/Picsart_25-01-11_20-54-43-509.jpg",
    "https://lh3.googleusercontent.com/-BokDlkyOZ2A/Z4KGcMq4-6I/AAAAAAAAWpo/i9kaEh5btbcJUuSz3r7VENygvV3bdVQMwCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_20-55-48-180.jpg",
    "https://lh3.googleusercontent.com/-BAMJXnqnsl0/Z4KGd87Z3WI/AAAAAAAAWps/9X67doUgqh4cWYnM27ZZlTnlRcKTyiFkgCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_20-57-04-064.jpg",
    "https://lh3.googleusercontent.com/-tO6wVQt-HL4/Z4KGfLh8DXI/AAAAAAAAWpw/j6tMrzwbB7ofBnPafkRpnBEiSkkBVwcugCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_20-58-42-139.jpg",
    "https://lh3.googleusercontent.com/-GmekrIl3LmA/Z4KGgZ--PsI/AAAAAAAAWp0/RzBE8QhP1TAFo-M-1oqQEa1TKepSjGs6wCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_20-59-37-029.jpg",
    "https://lh3.googleusercontent.com/-CZkguGaOKEQ/Z4KGh8UPqhI/AAAAAAAAWp4/Fg0SCW70gNk-X1DUrLC6vdYqVhC16NMPQCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_20-59-49-159.jpg",
    "https://lh3.googleusercontent.com/-wUmgcjcQxzI/Z4KGjFP7Z7I/AAAAAAAAWp8/BvBpkaNnmrI9cyp0b5KIJ-rvxisHtKaKgCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-00-31-540.jpg",
    "https://lh3.googleusercontent.com/-i0Y5F1V-n7A/Z4KGkQejotI/AAAAAAAAWqA/xw5MYZrvDJYP5W2hzlW5Diw91OheWIAuwCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-02-05-030.jpg",
    "https://lh3.googleusercontent.com/-s-2_oYSptRE/Z4KGlfiJ-sI/AAAAAAAAWqE/dTiH4K1Ye5Y94i5SP-C7ASpH6O2nJGi3wCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-04-41-099.jpg",
    "https://lh3.googleusercontent.com/-sFWqwiIE0aY/Z4KGmex-2GI/AAAAAAAAWqI/ZZPFvNjBVvYd_AI2l4iZtBjyOVivbSv_gCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-05-13-725.jpg",
    "https://lh3.googleusercontent.com/-_vugRNtk2aQ/Z4KGnklo6eI/AAAAAAAAWqM/FPTTMREBqv4U7ZBf8KjEzr5wH_TfZfAoQCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-06-04-885.jpg",
    "https://lh3.googleusercontent.com/-VyPWFieruqg/Z4KGoc8OzMI/AAAAAAAAWqQ/13slSXjZMBcOfFe8L3jgrRpctviO4aFUQCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-06-32-444.jpg",
    "https://lh3.googleusercontent.com/-E-_dYunmZpg/Z4KGqF3RFMI/AAAAAAAAWqU/TiDVUYQ9zSMuB6fUnG_7fcYlHh7xMT_vgCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-07-36-032.jpg",
    "https://lh3.googleusercontent.com/-ETkyzCZzEUY/Z4KGq7ZUBWI/AAAAAAAAWqY/uU1Ce1Q50vMpHfAaMfKrysSdUclF2mb-ACNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-08-24-173.jpg",
    "https://lh3.googleusercontent.com/-4uWl5MTXXmM/Z4KGronnPeI/AAAAAAAAWqc/ve7XGf5LdHkvRtw53YxfUjxMnAhkCYgggCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-09-40-190.jpg",
    "https://lh3.googleusercontent.com/-erkjhGTDvuI/Z4KGskGOgmI/AAAAAAAAWqg/QYy6m0zloJQVM1fzHQtlfsiQcrlzfc3kwCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-10-20-192.jpg",
    "https://lh3.googleusercontent.com/-eHeebYDxSmw/Z4KGuO_8u6I/AAAAAAAAWqk/CoXC_uZpWgYgK77iQG02yYaHiECcEz9SACNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-10-32-110.jpg",
    "https://lh3.googleusercontent.com/-GuIeLuKcLe4/Z4KGvd7Tr0I/AAAAAAAAWqo/NxImmUEzdGciLFdmIsLVctp9B5NvhquTgCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-10-39-452.jpg",
    "https://lh3.googleusercontent.com/-Sp-Zdk86DZI/Z4KGwT6UB1I/AAAAAAAAWqs/pSOp8hKYIS0pmOPbNAipUlzPOkBe_CJsgCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-11-10-384.jpg",
    "https://lh3.googleusercontent.com/-Lf9b0ErrP2k/Z4KGx5GWFaI/AAAAAAAAWqw/WjQRPVO0QLURr_vGxwCD0aAEn0aKusKAACNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-12-39-190.jpg",
    "https://lh3.googleusercontent.com/-NYEUvmfqeAI/Z4KGyxAJXiI/AAAAAAAAWq4/3I8-v9kOD-UTjDpGzS9ghIU37oU4b2caACNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-14-12-147.jpg",
    "https://lh3.googleusercontent.com/-owtDLfsuLTw/Z4KG0PMZFkI/AAAAAAAAWq8/wGyjhjEBgKMg4hOiU8A7Xedg6iJZXmiywCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-14-19-910.jpg",
    "https://lh3.googleusercontent.com/-7WASbdPUgYA/Z4KG1gQucTI/AAAAAAAAWrA/Dk2FpHiNyhMY7NeJZ9M_1RmkpTk5siONgCNcBGAsYHQ/s1600-rw/Picsart_25-01-11_21-14-50-024.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        color: Colors.grey[600],
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context,index){
            return ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 200,

              ),
              child: FadeInImage.memoryNetwork(
                image: images[index],
                placeholder: kTransparentImage,
              
              
              
              ),
            );

            }),
      )
    );
  }
}