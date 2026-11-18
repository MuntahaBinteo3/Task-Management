import 'dart:convert';
import 'package:get/get.dart';
import 'package:task_management/Constant/appurl.dart';
import 'package:http/http.dart';

class LoginController {
  var isLoading = false.obs;

  Future<void> login({required String email, required String password}) async {
    print('Login function called');
    try {
      var uri = Uri.parse(Appurl.login);

      print('Sending request...');

      var response = await post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'gmail': email, 'password': password}),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    } catch (e) {
      print('Error: $e');
    }
  }
}
