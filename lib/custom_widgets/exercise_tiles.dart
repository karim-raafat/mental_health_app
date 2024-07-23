import 'package:flutter/material.dart';

class ExerciseTiles extends StatelessWidget {
  String title;
  String? subtitle;
  IconData icon;
  Color color;
  ExerciseTiles({super.key,required this.title,this.subtitle,required this.icon,required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon,color: Colors.white,),
        ),
      ),
      title: Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      subtitle: Text(subtitle!,style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
      trailing: const Icon(Icons.more_horiz,color: Colors.grey,),
    );
  }
}
