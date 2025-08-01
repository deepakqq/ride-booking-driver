// import 'package:annale/core/translations/language_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/language_controller.dart';
// import '../models/language_model.dart';

// class LanguageTile extends StatelessWidget {
//   final LanguageModel language;

//   const LanguageTile({Key? key, required this.language}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<LanguageController>();

//     return Obx(() {
//       bool isSelected = controller.selectedLanguageCode.value == language.code;

//       return Container(
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: ListTile(
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//           title: Text(
//             language.name,
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: Colors.black87,
//             ),
//           ),
//           trailing: Icon(
//             isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
//             color: isSelected ? Colors.black : Colors.grey.shade400,
//           ),
//           onTap: () {
//             print('object');
//             controller.selectLanguage(language.code);
//             print(controller.selectedLanguageCode);
//           },
//         ),
//       );
//     });
//   }
// }

import 'package:annale_driver/core/translations/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageTile extends StatelessWidget {
  final LanguageModel language;

  const LanguageTile({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LanguageController>();

    return Obx(() {
      bool isSelected = controller.isSelected(language);

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          title: Text(
            language.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          trailing: Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? Colors.black : Colors.grey.shade400,
          ),
          onTap: () {
            controller.selectLanguage(language);
          },
        ),
      );
    });
  }
}
