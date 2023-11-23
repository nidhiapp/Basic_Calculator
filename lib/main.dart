import 'package:basic_calculator/view/calculator_main_screen.dart';
import 'package:basic_calculator/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalProvider(),
      child:   const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: CalculatorMainScreen()),
    );
   
  }
}
