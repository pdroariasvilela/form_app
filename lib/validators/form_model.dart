import 'package:formz/formz.dart';

class RequiredText extends FormzInput<String, String> {
  const RequiredText.pure() : super.pure('');
  const RequiredText.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    return value?.isNotEmpty == true ? null : 'Este campo es obligatorio';
  }
}

class EmailInput extends FormzInput<String, String> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(value ?? '') ? null : 'Email inválido';
  }
}

class PhoneInput extends FormzInput<String, String> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    final phoneRegex = RegExp(r'^\d{9,15}$');
    return phoneRegex.hasMatch(value ?? '') ? null : 'Teléfono inválido';
  }
}

class ConfirmPasswordInput extends FormzInput<String, String> {
  final String password;

  const ConfirmPasswordInput.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordInput.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  String? validator(String? value) {
    return value == password ? null : 'Las contraseñas no coinciden';
  }
}

class AgeInput extends FormzInput<String, String> {
  const AgeInput.pure() : super.pure('');
  const AgeInput.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'La edad es obligatoria';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'Debe ser un número válido';
    }
    return age >= 18 ? null : 'Debes ser mayor de edad';
  }
}