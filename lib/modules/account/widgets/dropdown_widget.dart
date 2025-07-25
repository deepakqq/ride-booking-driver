import 'package:annale_driver/modules/account/controllers/dopdown_controller.dart';

import 'package:annale_driver/core/values/app_redius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class DropdownWidget extends StatelessWidget {
  final bool isChange;
  DropdownWidget({super.key, this.isChange = false});

  final DropdownController controller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: controller.toggleDropdown,
              child: Container(
                height: 52,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(controller.selectedItem.value),
                    Icon(
                      controller.isDropdownOpen.value
                          ? Icons
                                .keyboard_arrow_up_rounded // Changed icon direction
                          : Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                      size: 30.r,
                    ),
                  ],
                ),
              ),
            ),
            if (controller.isDropdownOpen.value)
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 2),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: AppRadius.r8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < controller.items.length; i++)
                        GestureDetector(
                          onTap: () {
                            // यहाँ सही method call करें
                            controller.selectItem(
                              controller.items[i],
                            ); // Changed this line
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Text(
                              controller.items[i],
                              style: TextStyle(color: Color(0xff323135)),
                            ),
                          ),
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
