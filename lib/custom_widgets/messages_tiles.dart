import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/pages/chat_page.dart';
import 'package:mental_health_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class MessagesTiles extends StatelessWidget {
  User user;
  MessagesTiles({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.goNamed(ChatPage.routeName);
        Provider.of<AppProvider>(context,listen: false).chosenUser = user;
        await Provider.of<AppProvider>(context,listen: false).getAllMsgs();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: user.iconColor
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.person,color: Colors.white,),
            ),
          ),
          title: Text(user.name,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
          trailing: const Icon(Icons.more_horiz,color: Colors.grey,),
        ),
      ),
    );
  }
}
