import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/modules/auth/widgets/file_upload_widget.dart';
import 'package:annale_driver/modules/auth/widgets/step_progress_indigator.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DocumentUploadScreen extends StatelessWidget {
  const DocumentUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  AuthHeader(
                    onBackPress: () {
                      if (controller.currentUploadStep.value == 0) Get.back();
                      controller.currentUploadStep.value =
                          controller.currentUploadStep.value - 1;
                    },
                    showBackBtn: true,
                    showSubtitle: true,
                    subTitle:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",

                    title: "Submit Documents".tr,
                  ),
                  AppSpacing.height16,
                  Obx(
                    () => StepProgressIndicator(
                      currentStep: controller.currentUploadStep.value,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Obx(() => _buildCurrentUploadStep(context, controller)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(22.r),
        child: AppButton(
          text1: "Next".tr,
          callback: () {
            if (controller.currentUploadStep.value == 2) {
              print(controller.userType);
              Get.toNamed(AppRoutes.dashboard);
              return;
            }
            controller.currentUploadStep.value =
                controller.currentUploadStep.value + 1;
          },
        ),
      ),
    );
  }

  Widget _buildCurrentUploadStep(
    BuildContext context,
    AuthController controller,
  ) {
    AuthController authController = Get.find();
    switch (controller.currentUploadStep.value) {
      case 0:
        return _buildSection(
          title: authController.userType == UserType.driver
              ? 'Attach photos of the national id card.'
              : "Attach photos of the business registration certificate",
          docTypeFront: DocumentType.nationalIdFront,
          docTypeBack: DocumentType.nationalIdBack,
          labelFront: authController.userType == UserType.driver
              ? 'Front side of National ID card'
              : "Front side of Business Registration Certificate",
          labelBack: authController.userType == UserType.driver
              ? 'Back side of National ID card'
              : "Back side of Business Registration Certificate",
          controller: controller,
        );
      case 1:
        return _buildSection(
          title: authController.userType == UserType.driver
              ? 'Attach photos of your driving license.'
              : "Attach photos of taxation / road tax proof",
          docTypeFront: DocumentType.drivingLicenseFront,
          docTypeBack: DocumentType.drivingLicenseBack,
          labelFront: authController.userType == UserType.driver
              ? 'Front side of Driving License'
              : "Front side of Taxation / Road Tax Proof",
          labelBack: authController.userType == UserType.driver
              ? 'Back side of Driving License'
              : "Back side of Taxation / Road Tax Proof",
          controller: controller,
        );
      case 2:
        return _buildSection(
          title: 'Attach photos of the passbook.',
          docTypeFront: DocumentType.passbookFront,
          docTypeBack: DocumentType.passbookBack,
          labelFront: 'Front side of Passbook',
          labelBack: 'Back side of Passbook',
          controller: controller,
        );
      default:
        return SizedBox();
    }
  }

  Widget _buildSection({
    required String title,
    required DocumentType docTypeFront,
    required DocumentType docTypeBack,
    required String labelFront,
    required String labelBack,
    required AuthController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        AppSpacing.height12,
        FileUploadWidget(
          label: labelFront,
          file: controller.uploadedDocuments[docTypeFront],
          onTap: () => controller.pickImage(docTypeFront),
        ),
        Row(
          children: [
            Expanded(child: Container(height: 2, color: Colors.grey)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Center(
                child: Text('and', style: TextStyle(color: Colors.grey)),
              ),
            ),
            Expanded(child: Container(height: 2, color: Colors.grey)),
          ],
        ),
        FileUploadWidget(
          label: labelBack,
          file: controller.uploadedDocuments[docTypeBack],
          onTap: () => controller.pickImage(docTypeBack),
        ),
      ],
    );
  }
}
