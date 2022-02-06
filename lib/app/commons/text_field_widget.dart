import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.keyboardType,
      this.initialValue,
      this.hintText,
      this.errorText,
      this.iconData,
      this.labelText,
      this.obscureText,
      this.suffixIcon,
      this.isFirst,
      this.isLast,
      this.style,
      this.textAlign,
      this.suffix,
      this.limit})
      : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            width: 2,
            // style: BorderStyle.none,
          ),
        ),
      ),
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst!) {
      return BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast!) {
      return BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst! && isLast != null && !isLast!) {
      return BorderRadius.all(Radius.circular(0));
    }
    return BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 20;
    } else if (isFirst == null) {
      return 20;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}
