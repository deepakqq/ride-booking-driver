// file: file_upload_widget.dart
import 'dart:io';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadWidget extends StatelessWidget {
  final String label;
  final XFile? file; // अपलोड की गई फ़ाइल
  final VoidCallback onTap;

  const FileUploadWidget({
    Key? key,
    required this.label,
    this.file,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: label, color: Colors.black, fontSize: 14),
        // Text(label, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            color: Colors.green,
            strokeWidth: 1,
            dashPattern: const [6, 6],
            child: Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF8F7FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: file == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.iconUploadDoc, height: 30.h),
                        SizedBox(height: 8),
                        Text(
                          'CLICK TO UPLOAD',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(File(file!.path), fit: BoxFit.cover),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
