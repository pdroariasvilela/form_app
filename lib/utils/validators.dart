import 'package:flutter_application_form/validators/email.dart';
import 'package:formz/formz.dart';
import '../validators/password.dart';
import '../validators/confirm_password.dart';
import '../validators/required_text.dart';
import '../validators/name.dart';
extension ErrorMessageExtension<Value, ErrorType> on FormzInput<Value, ErrorType> {
  
  String? get errorMessage => !pure && invalid ? _mapErrorToMessage() : null;

  String _mapErrorToMessage() {
    if (error is EmailValidationError) {
      switch (error as EmailValidationError) {
        case EmailValidationError.empty:
          return 'El email es obligatorio';
        case EmailValidationError.invalid:
          return 'Introduce un email válido';
      }
    } else if (error is PasswordValidationError) {
      switch (error as PasswordValidationError) {
        case PasswordValidationError.empty:
          return 'La contraseña es obligatoria';
        case PasswordValidationError.tooShort:
          return 'La contraseña debe tener al menos 8 caracteres';
        case PasswordValidationError.noUppercase:
          return 'Debe contener al menos una letra mayúscula';
        case PasswordValidationError.noLowercase:
          return 'Debe contener al menos una letra minúscula';
        case PasswordValidationError.noNumber:
          return 'Debe contener al menos un número';
      }
    } else if (error is ConfirmPasswordValidationError) {
      switch (error as ConfirmPasswordValidationError) {
        case ConfirmPasswordValidationError.empty:
          return 'Confirma tu contraseña';
        case ConfirmPasswordValidationError.notMatch:
          return 'Las contraseñas no coinciden';
      }
    } else if (error is RequiredTextValidationError) {
      switch (error as RequiredTextValidationError) {
        case RequiredTextValidationError.empty:
          return 'Este campo es obligatorio';
      }
    } else if (error is NameValidationError) {
      switch (error as NameValidationError) {
        case NameValidationError.empty:
          return 'El nombre es obligatorio';
        case NameValidationError.invalid:
          return 'El nombre solo debe contener letras y espacios';
        case NameValidationError.tooLong:
          return 'El nombre no puede exceder los 30 caracteres';
      }
    }
    return 'Entrada inválida';
  }
}