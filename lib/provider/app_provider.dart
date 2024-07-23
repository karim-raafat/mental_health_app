import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:mental_health_app/models/message.dart';
import 'package:mental_health_app/models/user.dart';
import 'package:mental_health_app/pages/home_page.dart';
import '../database/database.dart';
import '../utils/helper_methods.dart';

class AppProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  late User loggedUser = User(userID: 6, name: '', iconColor: generateRandomColor());

  int get selectedIndex => _selectedIndex;
  List<User> allUsers = [];
  late User chosenUser =  User(userID: 7, name: '', iconColor: generateRandomColor());
  List<Message> all_msgs = [];

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<void> createUser(
      BuildContext context, String email, String password, String name) async {
    Response response = await create_User(email, password, name);
    switch (response.statusCode) {
      case 201:
        showMsg(context, 'User created Successfully! You can Login now');
        context.pop();
        break;
      case 400:
        showMsg(context, 'Email already exists, try logging instead');
        break;
    }
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    Response response = await loginUser(email, password);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      loggedUser = User(
          userID: data['id'],
          email: email,
          password: password,
          name: data['name'],
          iconColor: generateRandomColor());
      showMsg(context, data['status']);
      context.goNamed(HomePage.routeName);
    } else {
      showMsg(context, 'Invalid Email or Password');
    }
    notifyListeners();
  }

  Future<void> getAllUsers() async {
    allUsers = [];
    Response response = await get_all_users();
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        User tmp = User(
            userID: data[i][1],
            name: data[i][0],
            iconColor: generateRandomColor());
        if (tmp.userID != loggedUser.userID) {
          allUsers.add(tmp);
        }
      }
    }
    notifyListeners();
  }

  Future<void> getAllMsgs() async {
    Response response = await get_al_msg(loggedUser.userID, chosenUser.userID);
    all_msgs=[];
    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      for(int i = 0 ;i<data.length; i++){
        all_msgs.add(Message(id: data[i][0], time: data[i][1], content: data[i][2], isSent: data[i][3] == loggedUser.userID));
      }
    }
    sortMsgs();
    notifyListeners();
  }
  void sortMsgs(){
    List<Message> tmp = [];
    int size = all_msgs.length;
    for(int i = 0; i<size; i++){
      Message msg = all_msgs[0];
      for(int j = 0; j<all_msgs.length;j++){
        if(msg.time.compareTo(all_msgs[j].time) > 0){
          msg = all_msgs[j];
        }
      }
      tmp.add(msg);
      all_msgs.remove(msg);
    }
    all_msgs = tmp;
  }

  Future<void> sendMsg(String time,String content) async{
    await send_msg(time,content, loggedUser.userID, chosenUser.userID);
    await getAllMsgs();
    notifyListeners();
  }
}
