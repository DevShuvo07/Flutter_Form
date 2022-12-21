import 'package:flutter/material.dart';
import 'package:flutter_form/form.dart';

void main() {
  runApp(const FormApp());
}

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State<FormApp> createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Form",
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: form(),
    );
  }
}