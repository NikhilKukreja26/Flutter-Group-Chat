import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:group_chat_ui/res/app_colors.dart';

class BuildCustomCircularButton extends StatelessWidget {
  const BuildCustomCircularButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    this.iconSize = 4,
    this.radius = 3,
  }) : super(key: key);

  final IconData? iconData;
  final double? iconSize;
  final double? radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: radius?.w,
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary,
          child: Icon(
            iconData,
            size: iconSize?.w,
          ),
        ),
      ),
    );
  }
}
