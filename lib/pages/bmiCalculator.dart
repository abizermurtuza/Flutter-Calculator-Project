import 'package:calculator_app/components/big_button.dart';
import 'package:calculator_app/components/custom_box.dart';
import 'package:calculator_app/components/height_slider.dart';
import 'package:calculator_app/controller/bmi_controller.dart';
import 'package:calculator_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiCalculator extends StatelessWidget {
  BmiCalculator({super.key});
  BMIcontroller controller = Get.put(BMIcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.ubuntu(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: scaffoldBgColor,
      drawer: Drawer(
        backgroundColor: sheetBgColor,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Calculator',
                style: GoogleFonts.ubuntu(
                    color: white, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              onTap: () => Get.toNamed('/calculator'),
            ),
            ListTile(
              title: Text(
                'BMI Calculator',
                style: GoogleFonts.ubuntu(
                    color: white, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              onTap: () => Get.toNamed('/bmi'),
            ),
            // Add more pages here
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getInputBoxes(),
              const SizedBox(height: 25),
              _getDisplay(),
              const SizedBox(height: 15),
              BigButton(
                paramName: "Reset",
                onTap: () {
                  controller.resetAll();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getInputBoxes() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        HeightSlider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomBox(
              parameterName: 'Age',
              onChanged: (value) {
                controller.age.value = int.parse(value);
              },
            ),
            CustomBox(
              parameterName: 'Weight',
              onChanged: (value) {
                controller.weight.value = int.parse(value);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        BigButton(
          paramName: 'Calculate',
          onTap: () {
            controller.getBMI();
          },
        ),
      ],
    );
  }

  _getDisplay() {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 10),
        borderRadius: BorderRadius.circular(10),
        color: orange,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Obx(
              () => Text(
                'BMI: ${controller.bmi.value}',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Text(
              'Comment: ${controller.comment.value} ${controller.percentile.value}',
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              textAlign: TextAlign.center,
              'Tip: ${controller.tips.value}',
              style: GoogleFonts.ubuntu(
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
