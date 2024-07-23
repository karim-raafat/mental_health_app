import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_app/custom_widgets/chat_bubble.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';

class ChatPage extends StatefulWidget {
  static final String routeName = 'chat';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController msgController = TextEditingController();

  Timer? _updateTimer;

  @override
  void initState() {
    super.initState();
    _updateTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      context.read<AppProvider>().getAllMsgs();
    });
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Consumer<AppProvider>(
        builder:
            (BuildContext context, AppProvider appProvider, Widget? child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 30,
                                  color: Color(0xFFE0E0E0),
                                  blurStyle: BlurStyle.inner,
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      Text(
                        appProvider.chosenUser.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 30,
                                color: Color(0xFFE0E0E0),
                                blurStyle: BlurStyle.inner,
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.lightBlueAccent, blurRadius: 10)
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: appProvider.all_msgs.length,
                                itemBuilder: (context, index) => ChatBubble(
                                    msg: appProvider.all_msgs[index]),
                                shrinkWrap: true,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: TextFormField(
                                    controller: msgController,
                                    decoration: InputDecoration(
                                        hintText: 'write a message...',
                                        fillColor: Colors.blueGrey[100],
                                        filled: true,
                                        suffixIcon: GestureDetector(
                                          onTap: () async{
                                            final result = await FilePicker.platform.pickFiles();
                                            final file = result!.files.first;
                                          },
                                          child: const Icon(
                                              Icons.photo_library_outlined),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (msgController.text != '') {
                                          appProvider.sendMsg(
                                              DateFormat('HH:mm').format(DateTime.now()),
                                              msgController.text);
                                          msgController.clear();
                                        }
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue[800],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.send,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[800],
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 30,
                                            color: Color(0xFFE0E0E0),
                                            blurStyle: BlurStyle.inner,
                                          ),
                                        ],
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.mic,
                                          color: Colors.white,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
