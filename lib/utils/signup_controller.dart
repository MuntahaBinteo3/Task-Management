import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_management/Constant/appurl.dart';
import 'package:task_management/view/auth_view/custom_toast_message.dart';
import 'package:task_management/view/auth_view/verify_email_view.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var uri = Uri.parse(Appurl.signup);

      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'address': address,
          'password': password,
        }),
      );

      var data = jsonDecode(response.body);
      print('Status Code: ${response.statusCode}');
      print('Response Body: $data');

      if (response.statusCode == 200 || response.statusCode == 201) {
        CustomToast.showToast(data['message'] ?? 'Account Created Successfully!');
        Get.to(() => const VerifyEmailView());
      } else {
        CustomToast.showToast(data['message'] ?? 'Signup Failed!', isError: true);
      }
    } catch (e) {
      print('Error: $e');
      CustomToast.showToast('Something went wrong!', isError: true);
    } finally {
      isLoading.value = false;
    }
  }
}
