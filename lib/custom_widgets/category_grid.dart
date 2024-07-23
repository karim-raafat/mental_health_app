import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  Color color;
  String category;
  CategoryGrid({super.key,required this.color,required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0), // Add some roundness
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.8),
              color.withOpacity(0.5),
            ],
          ),
        ),
        child: Center(
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
        ),
      ),
    );
  }
}
