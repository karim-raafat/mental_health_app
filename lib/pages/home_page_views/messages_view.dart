import 'package:flutter/material.dart';
import 'package:mental_health_app/custom_widgets/messages_tiles.dart';
import 'package:mental_health_app/provider/app_provider.dart';
import 'package:provider/provider.dart';



class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context,listen: false).getAllUsers();
  }
  @override
  Widget build(BuildContext context)  {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Expanded(
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
                    'Contacts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  )
                ],
              ),
              ListView.builder(
                itemCount: appProvider.allUsers.length,
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemBuilder: (context,index) {
                  return MessagesTiles(user: appProvider.allUsers[index],);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
