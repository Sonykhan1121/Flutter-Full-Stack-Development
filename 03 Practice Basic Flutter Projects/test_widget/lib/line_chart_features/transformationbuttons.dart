import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Transformationbuttons extends StatelessWidget {
  final TransformationController controller;

  Transformationbuttons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tooltip(
          message: 'Zoom in',
          child: IconButton(
            onPressed: _transformationZoomIn,
            icon: Icon(Icons.add, size: 16.sp),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Tooltip(
              message:"Move left",
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios,size: 16.sp,),
                onPressed: _transformationMoveLeft,
              ),
            ),
            Tooltip(
              message: "Reset",
              child: IconButton(onPressed: _transformationReset, icon: Icon(Icons.refresh,size: 16.sp,),),
            ),
            Tooltip(
              message: "Move right",
              child: IconButton(onPressed: _transformationZoomOut, icon: Icon(Icons.arrow_forward_ios,size: 16.sp,))
              ,
            )

          ],
        ),
        Tooltip(
          message: 'Zoom out',
          child: IconButton(
            onPressed: _transformationZoomOut,
            icon: Icon(Icons.minimize, size: 16.sp),
          ),
        ),
      ],
    );
  }

  void _transformationReset() {
    controller.value = Matrix4.identity();
  }

  void _transformationZoomIn() {
    controller.value *= Matrix4.diagonal3Values(1.1, 1.1, 1);
  }

  void _transformationMoveLeft() {
    controller.value *= Matrix4.translationValues(20, 0, 0);
  }

  void _transformationMoveRight() {
    controller.value *= Matrix4.translationValues(-20, 0, 0);
  }

  void _transformationZoomOut() {
    controller.value *= Matrix4.diagonal3Values(0.9, 0.9, 1);
  }
}
