import 'package:calculator_app/controller/input_controller.dart';
import 'package:calculator_app/components/button.dart';
import 'package:calculator_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatelessWidget {
  Calculator({super.key});
  final List<String> buttons = [
    'AC',
    '+/-',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'DEL',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(InputController());

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: orange,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: Icon(Icons.menu),
          ),
        ),
        title: Text(
          'Calculator',
          style: GoogleFonts.ubuntu(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: GetBuilder<InputController>(
              builder: (context) {
                return _getOutput(controller);
              },
            ),
          ),
          Flexible(
            flex: 5,
            child: _getInput(controller),
          )
        ],
      ),
    );
  }

  _getInput(InputController controller) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: sheetBgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return CustomButton(
                color: topOperator,
                textColor: white,
                text: buttons[index],
                buttonTapped: () {
                  controller.clearInputOutput();
                },
              );
            case 1:
              return CustomButton(
                color: topOperator,
                textColor: white,
                text: buttons[index],
                buttonTapped: () {
                  controller.signChange();
                },
              );
            case 2:
              return CustomButton(
                color: topOperator,
                textColor: white,
                text: buttons[index],
                buttonTapped: () {
                  controller.percentSign();
                },
              );
            case 3:
              return CustomButton(
                color: orange,
                textColor: black,
                text: buttons[index],
                buttonTapped: () {
                  controller.onBtnTapped(buttons, index);
                },
              );
            case 7:
              return CustomButton(
                color: orange,
                textColor: black,
                text: buttons[index],
                buttonTapped: () {
                  controller.onBtnTapped(buttons, index);
                },
              );
            case 11:
              return CustomButton(
                color: orange,
                textColor: black,
                text: buttons[index],
                buttonTapped: () {
                  controller.onBtnTapped(buttons, index);
                },
              );
            case 15:
              return CustomButton(
                color: orange,
                textColor: black,
                text: buttons[index],
                buttonTapped: () {
                  controller.onBtnTapped(buttons, index);
                },
              );
            case 18:
              return CustomButton(
                color: deleteButton,
                textColor: white,
                text: buttons[index],
                buttonTapped: () {
                  controller.deleteBtn();
                },
              );
            case 19:
              return CustomButton(
                color: orange,
                textColor: black,
                text: buttons[index],
                buttonTapped: () {
                  controller.onEqualPressed();
                },
              );
            default:
              return CustomButton(
                color: buttonBackground,
                textColor: white,
                text: buttons[index],
                buttonTapped: () {
                  controller.onBtnTapped(buttons, index);
                },
              );
          }
        },
      ),
    );
  }

  _getOutput(InputController controller) {
    return Padding(
      padding: EdgeInsets.only(top: 70, right: 20),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                controller.currentInput.toString(),
                style: GoogleFonts.ubuntu(
                  color: white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              controller.answer.toString(),
              style: GoogleFonts.lora(
                color: white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
