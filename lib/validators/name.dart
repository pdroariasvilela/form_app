import 'package:formz/formz.dart';

enum NameValidationError { empty, invalid, tooLong }

class Name extends FormzInput<String, NameValidationError> {

  const Name.pure() : super.pure('');

  const Name.dirty([super.value = '']) : super.dirty();

  static final RegExp _nameRegExp = RegExp(r'^[A-Za-z\s]+$');

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) {
      return NameValidationError.empty;
    }
    if (!_nameRegExp.hasMatch(value)) {
      return NameValidationError.invalid;
    }
    if (value.length > 30) {
      return NameValidationError.tooLong;
    }
    return null;
  }
}