import 'package:flutter/material.dart';
import 'package:task_management/view/auth_view/task_details.dart';
import 'package:task_management/view/auth_view/taskmanagerapp.dart';
import 'package:task_management/view/splash_view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Task Management', home: SplashView());
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Task Management',
    home: TaskManagerApp(),
  );
}
