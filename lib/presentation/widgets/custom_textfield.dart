
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.textFieldKey,
    this.autofocus = false,
    this.autoCorrect = false,
    this.controller,
    this.initialVal,
    this.enabled = true,
    this.hintText,
    this.keyboardType,
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.suffixIconTap,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.isImp = false,
    this.prefixIcon,
    this.readOnly = false,
    this.inputWithLabel = false,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.height,
    this.width,
    this.isUpload = false,
    this.inputFormatters,
    this.textCapitalization,
    this.expands = false,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.contentPadding,
    this.borderLess,
    this.isFill = false,
    this.fillColor,
    this.borderRadius,
    this.hintTextStyle,
    this.cursorColor,
    this.textStyle,
    this.errorStyle,
    this.helperText, this.borderColor,
  });

  final TextCapitalization? textCapitalization;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final Function()? onTap;
  final Function()? suffixIconTap;
  final EdgeInsets? contentPadding;
  final bool enabled;
  final Key? textFieldKey;
  final bool readOnly;
  final bool autoCorrect;
  final String? initialVal;
  final Function(String)? onChanged;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final bool? inputWithLabel;
  final String? labelText;
  final bool? isImp;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isUpload;
  final bool expands;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? borderLess;
  final bool? isFill;
  final Color? fillColor;
  final Color? cursorColor;
  final double? borderRadius;
  final String? helperText;
  final Color? borderColor;


  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      gapPadding: 0,
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      borderSide: BorderSide(
        color: borderColor ??  Theme.of(context).colorScheme.primaryContainer,
        width: 0.5,
      ),
    );

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: textFieldKey,
      controller: controller,
      initialValue: initialVal,
      cursorColor: cursorColor ?? Theme.of(context).primaryColor,
      cursorHeight: isUpload ? 0 : null,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorWidth: isUpload ? 0 : 2.0,
      obscureText: obscureText,
      autocorrect: autoCorrect,
      showCursor: true,
      inputFormatters: inputFormatters,
      validator: validator,
      onTap: onTap,
      enabled: !readOnly,
      keyboardType: isUpload ? TextInputType.none : keyboardType,
      decoration: InputDecoration(
        filled: isFill,
        isDense: true,
        helperText: helperText,
        fillColor: isFill == true ? fillColor : null,
        counter: const Offstage(),
        border: borderLess == true ? InputBorder.none : outlineInputBorder,
        enabledBorder:
            borderLess == true ? InputBorder.none : outlineInputBorder,
        focusedBorder: borderLess == true ? InputBorder.none : outlineInputBorder ,
        errorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(color: Color(0xFFEA4335)),
        ),
        disabledBorder: outlineInputBorder.copyWith(),
        prefixIcon: prefixIcon != null
            ? GestureDetector(child: Center(child: prefixIcon))
            : null,
        prefixIconConstraints: prefixIcon != null
            ? BoxConstraints(
                maxWidth: 14.w,
              )
            : null,
        suffixIconConstraints: suffixIcon != null
            ? BoxConstraints(
                maxWidth: 14.w,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: suffixIconTap,
                child: Center(
                  child: suffixIcon,
                ))
            : null,
        hintText: hintText,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 4.w)
                .copyWith(right: suffixIcon == null ? 10.sp : 0),
        hintStyle: hintTextStyle ??
            TextStyle(
              overflow: TextOverflow.ellipsis,
              color: const Color(0xFFABB3BB),
              fontSize: 12.sp,
            ),
        errorStyle: errorStyle ??
            Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.red,
                  fontSize: 10.sp,
                ),
      ),
      style: textStyle ??
          TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12.sp,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
