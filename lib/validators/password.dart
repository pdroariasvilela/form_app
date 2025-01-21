import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tooShort, noUppercase, noLowercase, noNumber }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  static final RegExp _uppercaseRegExp = RegExp(r'[A-Z]');
  static final RegExp _lowercaseRegExp = RegExp(r'[a-z]');
  static final RegExp _numberRegExp = RegExp(r'\d');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 8) {
      return PasswordValidationError.tooShort;
    }
    if (!_uppercaseRegExp.hasMatch(value)) {
      return PasswordValidationError.noUppercase;
    }
    if (!_lowercaseRegExp.hasMatch(value)) {
      return PasswordValidationError.noLowercase;
    }
    if (!_numberRegExp.hasMatch(value)) {
      return PasswordValidationError.noNumber;
    }
    return null;
  }
}