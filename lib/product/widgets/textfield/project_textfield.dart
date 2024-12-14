import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProjectTextField extends StatelessWidget {
  const ProjectTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.onChanged,
    this.onClearPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.cursorColor,
    this.contentPadding,
    this.border = InputBorder.none,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onClearPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: textStyle ?? context.textTheme().bodyMedium,
      cursorColor: cursorColor ?? ProjectColors.cobaltBlue,
      decoration: InputDecoration(
        hintText: hintText ?? ProjectStrings.tfHintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ??
            (controller.text.isNotEmpty && onClearPressed != null
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: onClearPressed,
                  )
                : null),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: context.lowValue2,
              vertical: context.lowValue1,
            ),
        border: border,
      ),
      onChanged: onChanged,
    );
  }
}
