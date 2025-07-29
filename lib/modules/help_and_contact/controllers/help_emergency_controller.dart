import 'package:get/get.dart';

class HelpEmergencyController extends GetxController {
  // Form input fields
  var relationship = ''.obs;
  var contact = '0909090909'.obs;
  var email = 'test@gg.com'.obs;

  // This flag decides if form is shown or card
  var showContactCard = false.obs;

  void submitForm() {
    // Add validation if needed
    if (relationship.value.isNotEmpty &&
        contact.value.isNotEmpty &&
        email.value.isNotEmpty) {
      showContactCard.value = true;
    }
  }

  void resetForm() {
    relationship.value = '';
    contact.value = '';
    email.value = '';
    showContactCard.value = false;
  }
}
