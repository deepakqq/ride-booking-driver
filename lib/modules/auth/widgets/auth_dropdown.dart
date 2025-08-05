// file: dropdown_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDropdown extends StatefulWidget {
  // --- बाहर से आने वाले पैरामीटर्स ---
  final List<String> items;
  final String hintText;
  final String? value; // वर्तमान में चयनित वैल्यू, जो पैरेंट कंट्रोलर से आएगी
  final String? prefixIcon; // वैकल्पिक प्रीफिक्स आइकन
  final ValueChanged<String>
  onChanged; // जब कोई आइटम चुना जाए तो यह कॉलबैक कॉल होगा

  const AuthDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    this.value,
    this.prefixIcon,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AuthDropdown> createState() => _AuthDropdownState();
}

class _AuthDropdownState extends State<AuthDropdown> {
  // ड्रॉपडाउन के खुलने/बंद होने की स्थिति को मैनेज करने के लिए लोकल स्टेट
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // यह मुख्य ड्रॉपडाउन बटन है
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            height: 52.h,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xffDFDFDF),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Image.asset(widget.prefixIcon!, height: 20.h),
                  ),
                Expanded(
                  child: Text(
                    // अगर बाहर से कोई वैल्यू नहीं आई है, तो हिंट टेक्स्ट दिखाएं
                    widget.value ?? widget.hintText,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: widget.value == null
                          ? Colors.grey.shade600
                          : Colors.black,
                    ),
                  ),
                ),
                Icon(
                  _isDropdownOpen
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                  size: 30.r,
                ),
              ],
            ),
          ),
        ),

        // यह ड्रॉपडाउन की लिस्ट है
        if (_isDropdownOpen)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: const Color(0xffDFDFDF),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.items.map((item) {
                    return GestureDetector(
                      onTap: () {
                        widget.onChanged(item);

                        _toggleDropdown();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        color: widget.value == item
                            ? Colors.grey.shade400
                            : Colors.transparent,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
