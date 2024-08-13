import 'package:calculator_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBox extends StatelessWidget {
  final String parameterName;
  final Function(String) onChanged;

  CustomBox({
    super.key,
    required this.parameterName,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.25,
      height: Get.height * 0.1,
      decoration: BoxDecoration(
        color: sheetBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            parameterName,
            style: GoogleFonts.ubuntu(
              fontSize: 15,
              color: white,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[0-9]'),
              ),
              LengthLimitingTextInputFormatter(3),
            ],
            style: GoogleFonts.ubuntu(
              color: orange,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: white,
                ),
              ),
              hintText: 'Enter $parameterName',
              hintStyle: GoogleFonts.ubuntu(
                color: orange.withOpacity(0.3),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid $parameterName';
              }
              return null;
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                onChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
