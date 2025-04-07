import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool centerContent;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomProfileTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.trailing,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.onTap,
    this.onLongPress,
    this.centerContent = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (leading != null) leading!,
          if (leading != null) SizedBox(width: contentPadding?.horizontal ?? 8),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  centerContent
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              mainAxisAlignment:
                  centerContent
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: titleStyle ?? theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      subtitle!,
                      style:
                          subtitleStyle ??
                          theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodySmall?.color,
                            fontSize: 14.sp,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null)
            SizedBox(width: contentPadding?.horizontal ?? 8),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
