import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/validator/validators/password_validators_enum.dart';
import 'package:toolo_gostar/presentation/validator/validators/url_validators_enum.dart';
import 'package:toolo_gostar/presentation/validator/validators/user_name_validators_enum.dart';

class Validators {
  static UserNameValidatorsEnum? userNameValidator(
      TextEditingController controller) {
    // at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return UserNameValidatorsEnum.canNotEmpty;
    }
    /* if (text.length < 3) {
      return UserNameValidatorsEnum.lenTooShort;
    } */
    // return null if the text is valid
    return null;
  }

  static PasswordValidatorsEnum? passwordValidator(
      TextEditingController controller) {
    // at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return PasswordValidatorsEnum.canNotEmpty;
    }
    if (text.length < 3) {
      return PasswordValidatorsEnum.lenTooShort;
    }
    // return null if the text is valid
    return null;
  }

  static UrlValidatorsEnum? urlValidator(TextEditingController controller) {
    // at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return UrlValidatorsEnum.canNotEmpty;
    }
    if (text.length < 7) {
      return UrlValidatorsEnum.lenTooShort;
    }
    // return null if the text is valid
    return null;
  }
}
