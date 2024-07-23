import 'package:flutter/material.dart';

class User{
  int userID;
  String? email;
  String? password;
  String name;
  Color iconColor;

  User({required this.userID,this.email,this.password,required this.name,required this.iconColor});
}