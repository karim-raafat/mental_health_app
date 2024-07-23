import 'package:flutter/material.dart';
import 'package:mental_health_app/custom_widgets/category_grid.dart';
import 'package:mental_health_app/custom_widgets/exercise_tiles.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

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
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                            'Categories',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 100
                        ),
                        shrinkWrap: true,
                        children: [
                          CategoryGrid(color: Colors.purple, category: 'RelationShips'),
                          CategoryGrid(color: Colors.blue, category: 'Career'),
                          CategoryGrid(color: Colors.orange, category: 'Education'),
                          CategoryGrid(color: Colors.pink, category: 'Other'),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ExerciseTiles(title: 'Bobby Singer', subtitle: 'Education', icon: Icons.my_library_music, color: Colors.green),
                            ExerciseTiles(title: 'Dean Winchester', subtitle: 'Career', icon: Icons.edit, color: Colors.purpleAccent),
                            ExerciseTiles(title: 'Gwen Wilson', subtitle: 'Relationship', icon: Icons.favorite, color: Colors.redAccent),
                            ExerciseTiles(title: 'Mandy Montana', subtitle: 'Horoscopes', icon: Icons.my_library_music, color: Colors.orange),
                            ExerciseTiles(title: 'Bobby Singer', subtitle: 'Education', icon: Icons.my_library_music, color: Colors.green),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
