import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.autofocus = false,
      this.autoCorrect = false,
      this.errorText,
      this.controller,
      this.counterText,
      this.initialVal,
      this.enabled = true,
      this.addLabelSide = false,
      this.hintText,
      this.labelSideWidget,
      this.initialValue,
      this.keyboardType,
      this.labelText,
      this.maxLength,
      this.maxLines = 1,
      this.obscureText = false,
      this.onChanged,
      this.suffixIconTap,
      this.onFieldSubmitted,
      this.onTap,
      this.isImp = false,
      this.prefixIcon,
      this.readOnly = false,
      this.inputWithLabel = false,
      this.suffixIcon,
      this.suffixIconConstraints,
      this.textInputAction,
      this.validator,
      this.height,
      this.width,
      this.isUpload = false,
      this.inputFormatters,
      this.textCapitalization,
      this.contentPadding,
      this.prefixWidgetWidth})
      : super(key: key);

  final TextCapitalization? textCapitalization;
  final Function()? onTap;
  final Function()? suffixIconTap;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final bool autoCorrect;
  final String? initialVal;
  final Function(String)? onChanged;
  final bool autofocus;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? inputWithLabel;
  final String? labelText;
  final bool? isImp;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? counterText;
  final BoxConstraints? suffixIconConstraints;
  final String? errorText;
  final Widget? labelSideWidget;
  final bool addLabelSide;
  final EdgeInsetsGeometry? contentPadding;
  final bool isUpload;
  final double? prefixWidgetWidth;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      gapPadding: 0,
      borderRadius: BorderRadius.circular(9),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondaryContainer,
        width: 1,
      ),
    );

    TextFormField textFormField = TextFormField(
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      controller: controller,
      initialValue: initialVal,
      cursorColor: Theme.of(context).primaryColor,
      cursorHeight: isUpload ? 0 : null,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorWidth: isUpload ? 0 : 2.0,
      obscureText: obscureText,
      validator: validator,
      maxLines: maxLines,
      maxLength: maxLength,
      autocorrect: autoCorrect,
      inputFormatters: inputFormatters,
      onTap: onTap,
      enabled: !readOnly,
      keyboardType: isUpload ? TextInputType.none : keyboardType,
      decoration: InputDecoration(
        counter: const Offstage(),
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
        filled: true,
        enabledBorder: outlineInputBorder.copyWith(),
        border: outlineInputBorder.copyWith(),
        disabledBorder: outlineInputBorder.copyWith(),
        prefixIcon: prefixIcon != null
            ? GestureDetector(child: Center(child: prefixIcon))
            : null,
        prefixIconConstraints: prefixIcon != null
            ? BoxConstraints(
                maxWidth: prefixWidgetWidth ?? 15.w,
              )
            : null,
        suffixIconConstraints: suffixIcon != null
            ? BoxConstraints(
                maxWidth: 15.w,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: suffixIconTap,
                child: Center(
                  child: suffixIcon,
                ),
              )
            : null,
        hintText: hintText,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              // vertical: 1.sp,
              horizontal: 10.sp,
            ).copyWith(right: suffixIcon == null ? 10.sp : 0),
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
        errorText: errorText,
      ),
      onChanged: onChanged,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      // height: height ?? 27.w,
      width: width ?? double.infinity,
      child: inputWithLabel!
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(labelText!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  )),
                          if (isImp!)
                            const Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                      if (addLabelSide) labelSideWidget!
                    ],
                  ),
                ),
                textFormField
              ],
            )
          : textFormField,
    );
  }
}
