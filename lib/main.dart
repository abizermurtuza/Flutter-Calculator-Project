import 'package:calculator_app/pages/bmiCalculator.dart';
import 'package:calculator_app/pages/calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Calculator App",
      debugShowCheckedModeBanner: false,
      initialRoute: '/calculator',
      getPages: [
        GetPage(name: '/calculator', page: () => Calculator()),
        GetPage(name: '/bmi', page: () => BmiCalculator()),
      ],
      theme: ThemeData(useMaterial3: true),
      home: Calculator(),
    );
  }
}
