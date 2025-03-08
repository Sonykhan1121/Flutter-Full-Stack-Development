import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_widget/theme/app_colors.dart';

class ChartTitle extends StatelessWidget {
  const ChartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.h,),
        Text(
          'Bitcoin Price History',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('2023/12/19 - 2024/12/17',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 14.h,),

      ],
    );
  }
}
