import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/modules/help_support/controller/help_support_controller.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// … (imports वग़ैरह वही रहें)

class ChatScreen extends StatelessWidget {
  final String title;
  final controller = Get.put(HelpSupportController());
  final TextEditingController inputController = TextEditingController();

  ChatScreen({super.key, this.title = "AnnAle Support"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(title: title, screenBGColor: true),
      backgroundColor: AppColors.screenBG,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.all(16.r),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index];
                    final isUser = msg.isUser;

                    return Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // avatar (left) for Support
                            if (!isUser)
                              CircleAvatar(
                                radius: 16.r,
                                backgroundImage: const AssetImage(
                                  AppImages.supportAvatar,
                                ),
                              ),

                            if (!isUser) SizedBox(width: 8.w),

                            // Bubble + label
                            Column(
                              crossAxisAlignment: isUser
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isUser ? 'User'.tr : 'Support'.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: isUser
                                        ? Colors.blueGrey
                                        : const Color(0xff2D6F3F),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.8,
                                  ),
                                  padding: EdgeInsets.all(12.r),
                                  decoration: BoxDecoration(
                                    borderRadius: AppRadius.r8,
                                    color: isUser
                                        ? null
                                        : Colors.white, // fallback
                                    gradient: isUser
                                        ? AppGradients.green
                                        : null,
                                  ),
                                  child: Text(
                                    msg.text,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: isUser
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            if (isUser) SizedBox(width: 8.w),

                            // avatar (right) for User
                            if (isUser)
                              CircleAvatar(
                                radius: 16.r,
                                backgroundImage: const AssetImage(
                                  AppImages.supportUserAvatar,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 👉 message input bar unchanged
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: const Color(0xffE8F9DB),
                  borderRadius: AppRadius.r8,
                  border: Border.all(color: const Color(0xff7BDA40)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: inputController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message...".tr,
                          hintStyle: TextStyle(color: Color(0xff2D6F3F)),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.sendMessage(inputController.text);
                        inputController.clear();
                      },
                      icon: const Icon(Icons.send, color: Color(0xff2D6F3F)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
