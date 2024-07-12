import 'package:flutter/services.dart';

class FormValidation {
  static List<TextInputFormatter>? onlyAlphabetDigit() =>
      [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))];

        static List<TextInputFormatter>? onlyDigit() =>
      [FilteringTextInputFormatter.allow(RegExp("[0-9]"))];

  // We can give only alphabet
  static String? validateName(String? val) {
    var _value = val ?? '';
    final _nameRegExp = RegExp(AppRegex.nameRegex);
    if (_value.isEmpty) {
      return AppRegex.requiredText;
    } else if (!_nameRegExp.hasMatch(_value)) {
      return AppRegex.invalidName;
    }
    return null;
  }

  /// ------------------ Check Value is Empty ------------------

  static String? isEmpty(String? text) {
    if (text!.isEmpty) {
      return AppRegex.requiredText;
    }
    return null;
  }
   static String? accountName(String? text) {
    if (text!.isEmpty) {
      return AppRegex.accountRequired;
    }
    return null;
  }
     static String? opportunity(String? text) {
    if (text!.isEmpty) {
      return AppRegex.opportunityRequired;
    }
    return null;
  }

  /// ------------------ Mobile Number  Validation ------------------

  static String? mobileNoValidation(String? number) {
    if (number?.isEmpty ?? false) {
      return AppRegex.enterMobileNumber;
    }
    if (number!.isNotEmpty) {
      if (number.length < AppRegex.minPhoneNumberLength) {
        return AppRegex.validMobileNumber;
      } else if (!RegExp(AppRegex.mobileRegex).hasMatch(number.trim())) {
        return AppRegex.validMobileNumber;
      }
    }
    return null;
  }

  /// ------------------ Email Validation ------------------

  static String? emailValidation(String? email) {
    if (email!.trim().isEmpty) {
      return AppRegex.provideEmilId;
    }
    /*else if (email.trim().length < AppIntegers.minEmailLength) {
      return AppRegex.emailLength;
    } */
    else if (!RegExp(AppRegex.emailRegex).hasMatch(email.trim())) {
      return AppRegex.validEmail;
    }
    return null;
  }

  // We have validate a lot of things in password
  //(like - length between 8-15, minimum one capital and one small letter, minimum one special character)
  static String? validatePassword(String? val) {
    var _value = val ?? '';
    final _passwordRegExp = RegExp(AppRegex.passwordRegex);
    if (_value.isEmpty) {
      return AppRegex.requiredText;
    } else if (!_passwordRegExp.hasMatch(_value)) {
      return AppRegex.passwordMustContain;
    }
    return null;
  }

  /// ------------------ URL Validation ------------------

  static String? urlValidation(String? url) {
    if (url!.trim().isEmpty) {
      return AppRegex.provideURL;
    } else if (!Uri.parse(url).isAbsolute) {
      return AppRegex.validURL;
    }
    return null;
  }

  /// ------------------Website Validation ------------------

  static String? websiteValidation(String? website) {
    if (website!.trim().isEmpty) {
      return AppRegex.provideWebsite;
    } else if (!RegExp(AppRegex.websiteUrlRegex).hasMatch(website.trim())) {
      return AppRegex.validWebsite;
    }
    return null;
  }
}

class AppRegex {
  static const int minPhoneNumberLength = 5;

  /// email validation pattern
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  /// password validation pattern
  static const String passwordRegex =
      r'^((?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,15}$)';

  /// name validation pattern
  static const String nameRegex =
      r"^\s*([A-Za-z]{1,}([\.,] |[-']|| ))+[A-Za-z]+\.?\s*$";

  /// mobile validation pattern
  static const String mobileRegex = r'(^(?:[+0]9)?[0-9]{9,11}$)';

  // URL validation pattern
  static const String urlRegex =
      r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';

  // Website URL validation pattern
  static const String websiteUrlRegex =
      r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';

  static const String requiredText = 'Required*';
    static const String accountRequired = 'Account is a Required Field';
static const String opportunityRequired = "Opportunity is Required Field";
  static const String invalidName = 'Invalid Name';
  static const String passwordMustContain =
      'Password must be 8-15 characters with min one num,\none capital, one small letter, and one special char.';
  static const String provideEmilId = 'Provide Your Email ID';
  static const String provideURL = 'Provide the URL';
  static const String provideWebsite = 'Provide the Website';
  static const String emailLength =
      'Email length should be minimum of 10 characters';
  static const String validEmail = 'Please enter a valid email';
  static const String validURL = 'Please enter a valid URL';
  static const String validWebsite = 'Please enter a valid Website';
  static const String takePhoto = 'Take Photo';
  static const String chooseFromLib = 'Choose from Library';
  static const String removeProfileImage = 'Remove profile image';
  static const String mobileNumberMinimum = 'Mobile number ranges from 9-12';
  static const String validMobileNumber = 'Please enter a valid mobile number';
  static const String enterMobileNumber = 'Please enter mobile number';

  static const String alreadyUpdated = 'Already Updated';
}
