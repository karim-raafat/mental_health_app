import 'package:flutter/material.dart';
import 'package:mental_health_app/custom_widgets/emotion_card.dart';
import 'package:mental_health_app/custom_widgets/exercise_tiles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmotionCard(
                        emotion: '😔',
                        state: 'Badly',
                      ),
                      EmotionCard(emotion: '☺', state: 'Fine'),
                      EmotionCard(
                        emotion: '😁',
                        state: 'Well',
                      ),
                      EmotionCard(
                        emotion: '😃',
                        state: 'Excellent',
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.lightBlueAccent, blurRadius: 10)
                    ],
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  // shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(80)),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exercises',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    ExerciseTiles(
                        title: 'Speaking Skills',
                        subtitle: '16 Exercises',
                        icon: Icons.favorite,
                        color: Colors.orange),
                    ExerciseTiles(
                        title: 'Reading Speed',
                        subtitle: '8 Exercises',
                        icon: Icons.person,
                        color: Colors.blue),
                    ExerciseTiles(
                        title: 'Listening Skills',
                        subtitle: '16 Exercises',
                        icon: Icons.headphones,
                        color: Colors.pink),
                    ExerciseTiles(
                        title: 'Mental Skills',
                        subtitle: '16 Exercises',
                        icon: Icons.calculate,
                        color: Colors.green),
                    ExerciseTiles(
                        title: 'Speaking Skills',
                        subtitle: '16 Exercises',
                        icon: Icons.favorite,
                        color: Colors.orange),
                    ExerciseTiles(
                        title: 'Speaking Skills',
                        subtitle: '16 Exercises',
                        icon: Icons.favorite,
                        color: Colors.orange),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
