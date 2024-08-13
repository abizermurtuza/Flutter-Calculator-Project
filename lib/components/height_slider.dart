import 'package:calculator_app/controller/bmi_controller.dart';
import 'package:calculator_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightSlider extends StatelessWidget {
  final BMIcontroller controller = Get.put(BMIcontroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        color: sheetBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              '${controller.height.value.round().toString()} CM',
              style: GoogleFonts.ubuntu(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Obx(
            () => Slider(
              activeColor: orange,
              inactiveColor: grey,
              thumbColor: white,
              min: 50.0,
              max: 250.0,
              divisions: 200,
              value: controller.height.value,
              onChanged: (double newValue) {
                controller.height.value = newValue;
                controller.update();
              },
            ),
          ),
        ],
      ),
    );
  }
}
