// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Views/Widgets/masked_text_Input_formatter.dart.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditController,
      required this.inputType,
      required this.enableBorder,
      this.hintTextString,
      this.themeColor,
      this.cornerRadius,
      this.maxLength,
      this.prefixIcon,
      this.lable,
      this.textColor,
      this.textInputAction,
      this.autoFocus = false,
      this.onSubmit,
      this.errorMessage})
      : super(key: key);

  final String? hintTextString;
  final TextEditingController textEditController;
  final EInputType inputType;
  final bool enableBorder;
  final Color? themeColor;
  final double? cornerRadius;
  final int? maxLength;
  final Widget? prefixIcon;
  final Color? textColor;
  final String? errorMessage;
  final String? lable;
  final bool autoFocus;
  final Function? onSubmit;
  final TextInputAction? textInputAction;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isValidate = true;
  String validationMessage = '';
  bool visibility = false;
  int oldTextSize = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.lable != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(widget.lable!,
                      style: BaseTextStyle.body3(color: BaseColor.black)),
                )
              : Container(),
          TextFormField(
            autofocus: widget.autoFocus,
            controller: widget.textEditController,
            decoration: InputDecoration(
              hintText: widget.hintTextString,
              errorText: _isValidate ? null : validationMessage,
              counterText: '',
              border:
                  EInputType.Transfer == widget.inputType ? null : getBorder(),
              enabledBorder: EInputType.Transfer == widget.inputType
                  ? null
                  : widget.enableBorder
                      ? getBorder()
                      : InputBorder.none,
              focusedBorder: EInputType.Transfer == widget.inputType
                  ? null
                  : widget.enableBorder
                      ? getFocusBorder()
                      : InputBorder.none,
              labelStyle: getTextStyle(),
              prefixIcon: EInputType.Transfer == widget.inputType
                  ? null
                  : widget.prefixIcon ?? getPrefixIcon(),
              suffixIcon: EInputType.Transfer == widget.inputType
                  ? null
                  : getSuffixIcon(),
            ),
            onFieldSubmitted: (v) {
              FocusScope.of(context).unfocus();
              checkValidation(v);
              if (widget.onSubmit != null) widget.onSubmit!();
            },
            onChanged: checkValidation,
            onEditingComplete: () =>
                checkValidation(widget.textEditController.text),
            keyboardType: getInputType(),
            obscureText: widget.inputType == EInputType.Password && !visibility,
            maxLength: widget.inputType == EInputType.PaymentCard
                ? 19
                : widget.maxLength ?? getMaxLength(),
            style: TextStyle(
              color: widget.textColor ?? Colors.black,
            ),
            textInputAction: widget.textInputAction,
            inputFormatters: [getFormatter()],
          ),
        ],
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.cornerRadius ?? 12.0)),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black,
      ),
      gapPadding: 1,
    );
  }

  OutlineInputBorder getFocusBorder() {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.cornerRadius ?? 12.0)),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black,
      ),
      gapPadding: 1,
    );
  }

  // formatter on basis of textinput type
  TextInputFormatter getFormatter() {
    if (widget.inputType == EInputType.PaymentCard) {
      return MaskedTextInputFormatter(
        mask: 'xxxx xxxx xxxx xxxx',
        separator: ' ',
      );
    } else {
      return TextInputFormatter.withFunction((oldValue, newValue) => newValue);
    }
  }

  // text style for textinput
  TextStyle getTextStyle() {
    return TextStyle(
        color: widget.themeColor ?? Theme.of(context).primaryColor);
  }

  // input validations
  void checkValidation(String textFieldValue) {
    if (widget.inputType == EInputType.Default) {
      //default
      _isValidate = textFieldValue.isNotEmpty;
      validationMessage = widget.errorMessage ?? 'Filed cannot be empty';
    } else if (widget.inputType == EInputType.Email) {
      //email validation
      _isValidate = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(textFieldValue);
      validationMessage = widget.errorMessage ?? 'Email is not valid';
    } else if (widget.inputType == EInputType.Number) {
      //contact number validation
      _isValidate = textFieldValue.length == widget.maxLength;
      validationMessage = widget.errorMessage ?? 'Contact Number is not valid';
    } else if (widget.inputType == EInputType.Password) {
      //password validation
      _isValidate = RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
          .hasMatch(textFieldValue);
      _isValidate = true;
      validationMessage = widget.errorMessage ?? 'Password is not valid';
    } else if (widget.inputType == EInputType.PaymentCard) {
      //payment card validation
      _isValidate = textFieldValue.length == 19;
      validationMessage = widget.errorMessage ?? 'Card number is not correct';
    } else if (widget.inputType == EInputType.Transfer) {
      //payment card validation
      _isValidate = textFieldValue.isNotEmpty;
      validationMessage = widget.errorMessage ?? 'Dữ liệu không được để trống';
    }
    oldTextSize = textFieldValue.length;
    //change value in state
    setState(() {});
  }

  // return input type for setting keyboard
  TextInputType getInputType() {
    switch (widget.inputType) {
      case EInputType.Default:
        return TextInputType.text;

      case EInputType.Email:
        return TextInputType.emailAddress;

      case EInputType.Number:
        return TextInputType.number;

      case EInputType.PaymentCard:
        return TextInputType.number;

      case EInputType.Transfer:
        return TextInputType.number;

      default:
        return TextInputType.text;
    }
  }

  // get max length of text
  int getMaxLength() {
    switch (widget.inputType) {
      case EInputType.Default:
        return 36;

      case EInputType.Email:
        return 36;

      case EInputType.Number:
        return 10;

      case EInputType.Password:
        return 24;

      case EInputType.PaymentCard:
        return 19;

      case EInputType.Transfer:
        return 36;

      default:
        return 36;
    }
  }

  // get prefix Icon
  Icon getPrefixIcon() {
    switch (widget.inputType) {
      case EInputType.Default:
        return Icon(
          Icons.person,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case EInputType.Email:
        return Icon(
          Icons.email,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case EInputType.Number:
        return Icon(
          Icons.phone,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case EInputType.Password:
        return Icon(
          Icons.lock,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      case EInputType.PaymentCard:
        return Icon(
          Icons.credit_card,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );

      default:
        return Icon(
          Icons.person,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );
    }
  }

  // get suffix icon
  Widget getSuffixIcon() {
    if (widget.inputType == EInputType.Password) {
      return IconButton(
        onPressed: () {
          visibility = !visibility;
          setState(() {});
        },
        icon: Icon(
          visibility ? Icons.visibility : Icons.visibility_off,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        ),
      );
    } else {
      return const Opacity(opacity: 0, child: Icon(Icons.phone));
    }
  }
}

//input types
enum EInputType {
  None,
  Default,
  Email,
  Number,
  Password,
  PaymentCard,
  Transfer
}
