import 'package:flutter/material.dart';

class EmotionCard extends StatelessWidget {
  String emotion;
  String state;
  EmotionCard({super.key,required this.emotion,required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const[
                 BoxShadow(
                  blurRadius: 30,
                  color: Color(0xFFE0E0E0),
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(emotion,style: const TextStyle(fontSize: 30),),
            )),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Text(state,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}
