import 'package:annale_driver/modules/auth/repository/auth_repository.dart';
import 'package:annale_driver/widgets/upload_option_bottomsheet.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum UserType { driver, businessOwner }

class AuthController extends GetxController {
  final AuthRepository authRepository;

  var signUp = false.obs;

  var selectedGender = Rxn<String>();
  void onGenderChanged(String newValue) {
    selectedGender.value = newValue;

    print("Language selected in AuthController: ${selectedGender.value}");
  }

  AuthController({required this.authRepository});
  var userType = UserType.driver;
  // Example login method
  Future<void> login(String email, String password) async {
    try {
      await authRepository.login(email, password);
    } catch (e) {
      print("Login failed: $e");
    }
  }

  final ImagePicker _picker = ImagePicker();

  var uploadedDocuments = <DocumentType, XFile>{}.obs;

  var currentUploadStep = 0.obs;

  Future<void> pickImage(DocumentType docType) async {
    Get.bottomSheet(
      UploadOptionBottomSheet(onCameraTap: () {}, onFileTap: () {}),
    );
    // try {
    //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //   if (image != null) {
    //     uploadedDocuments[docType] = image;
    //     _updateProgressAndStep(); // प्रोग्रेस और स्टेप दोनों को अपडेट करें
    //   }
    // } catch (e) {
    //   Get.snackbar('Error', 'Failed to pick image: $e');
    // }
  }

  void _updateProgressAndStep() {
    if (uploadedDocuments.containsKey(DocumentType.passbookFront) &&
        uploadedDocuments.containsKey(DocumentType.passbookBack)) {
      currentUploadStep.value = 3;
      return;
    }

    if (uploadedDocuments.containsKey(DocumentType.drivingLicenseFront) &&
        uploadedDocuments.containsKey(DocumentType.drivingLicenseBack)) {
      currentUploadStep.value = 2;
      return;
    }

    if (uploadedDocuments.containsKey(DocumentType.nationalIdFront) &&
        uploadedDocuments.containsKey(DocumentType.nationalIdBack)) {
      currentUploadStep.value = 1;
      return;
    }
  }
}

enum DocumentType {
  nationalIdFront,
  nationalIdBack,
  drivingLicenseFront,
  drivingLicenseBack,
  passbookFront,
  passbookBack,
}
