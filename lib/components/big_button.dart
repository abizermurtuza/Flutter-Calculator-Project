import 'package:calculator_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BigButton extends StatelessWidget {
  String paramName;
  VoidCallback onTap;
  BigButton({super.key, required this.paramName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(
          color: black,
          width: 10,
        ),
        color: orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            paramName,
            style: GoogleFonts.ubuntu(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                const Shadow(
                  blurRadius: 3,
                  offset: Offset(1.0, 1.0),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
