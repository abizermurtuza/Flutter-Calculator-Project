import 'package:get/get.dart';

class BMIcontroller extends GetxController {
  RxDouble height = 50.0.obs; //In cm
  RxInt weight = 0.obs; //In kg
  RxInt age = 0.obs;
  RxDouble bmi = 0.0.obs;
  RxString comment = ''.obs;
  RxString tips = ''.obs;
  RxString percentile = ''.obs;
  RxDouble heightCm = 0.0.obs;

  getBMI() {
    heightCm.value = (height.value / 100);
    bmi.value = weight.value / (heightCm.value * heightCm.value);
    bmi.value = double.parse(bmi.value.toStringAsFixed(2));
    getStatus();
    getPercentile();
    update();
    return bmi;
  }

  getStatus() {
    if (bmi.value < 18.5) {
      comment.value = 'Underweight';
      tips.value =
          'Consider eating more nutrient-rich foods and working with a healthcare provider to ensure you’re meeting your nutritional needs.';
    } else if (bmi.value < 25) {
      comment.value = 'Normal weight';
      tips.value =
          'Maintain a balanced diet and regular physical activity to keep your BMI within a healthy range.';
    } else if (bmi.value < 30) {
      comment.value = 'Overweight';
      tips.value =
          'Focus on a healthy diet, portion control, and increasing physical activity. Consulting with a healthcare provider can help create a personalized plan.';
    } else {
      comment.value = 'Obese';
      tips.value =
          'It’s important to adopt a healthier lifestyle, including regular physical activity and a balanced diet. Consider seeking guidance from a healthcare provider for a comprehensive plan.';
    }
  }

  getPercentile() {
    if (age.value < 20) {
      if (bmi.value < 16) {
        percentile.value = 'Below 5th percentile';
      } else if (bmi.value < 18) {
        percentile.value = '5th to 85th percentile';
      } else if (bmi.value < 22) {
        percentile.value = '85th to 95th percentile';
      } else {
        percentile.value = 'Above 95th percentile';
      }
    } else {
      percentile.value = '';
    }
  }

  resetAll() {
    height.value = 50.0;
    weight.value = 0;
    age.value = 0;
    bmi.value = 0.0;
    comment.value = '';
    tips.value = '';
    percentile.value = '';
    heightCm.value = 0.0;
    update();
  }
}
