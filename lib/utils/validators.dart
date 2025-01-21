import 'package:formz/formz.dart';
import '../validators/email.dart';
import '../validators/password.dart';
import '../validators/confirm_password.dart';
import '../validators/required_text.dart';

extension ErrorMessage on FormzInput {
  
  String? get errorMessage => invalid ? _mapErrorToMessage() : null;

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
    }
    return 'Entrada inválida';
  }
}