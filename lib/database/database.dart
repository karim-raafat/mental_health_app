import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> get_all_users() async {
  final url = Uri.parse('http://127.0.0.1:5000/all_users');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> loginUser(String email, String password) async {
  final url = Uri.parse(
      'http://127.0.0.1:5000/users?email=$email&password=$password');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> create_User(
    String email, String password, String name) async {
  final url = Uri.parse('http://127.0.0.1:5000/users');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password, 'name': name}),
  );

  return response;
}

Future<http.Response> get_al_msg(int userID, int otherID) async {
  final url = Uri.parse('http://127.0.0.1:5000/chats/$userID/$otherID');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> send_msg(
    String time, String content, int userID, int otherID) async {
  final url = Uri.parse('http://127.0.0.1:5000/chats');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body : jsonEncode({'time':time , 'content': content, 'senderID': userID , 'receiverID': otherID}),
  );
  return response;
}
