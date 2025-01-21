import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { empty, notMatch }

class ConfirmPassword extends FormzInput<String, ConfirmPasswordValidationError> {
  final String password;

  const ConfirmPassword.pure({this.password = ''}) : super.pure('');
  const ConfirmPassword.dirty({required this.password, String value = ''}) : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmPasswordValidationError.empty;
    }
    return value == password ? null : ConfirmPasswordValidationError.notMatch;
  }

  ConfirmPassword copyWith({String? password}) {
    return ConfirmPassword.dirty(
      password: password ?? this.password,
      value: value,
    );
  }
}