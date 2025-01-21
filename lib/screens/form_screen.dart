import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import '../models/form_model.dart';
import 'result_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  RequiredText _name = const RequiredText.pure();
  EmailInput _email = const EmailInput.pure();
  PhoneInput _phone = const PhoneInput.pure();
  RequiredText _address = const RequiredText.pure();
  RequiredText _city = const RequiredText.pure();
  RequiredText _state = const RequiredText.pure();
  RequiredText _zipCode = const RequiredText.pure();
  AgeInput _age = const AgeInput.pure();

  ConfirmPasswordInput _confirmPassword =
      ConfirmPasswordInput.pure(password: '');

  String? _getErrorMessage(FormzInput input) {
    return input.invalid ? input.error : null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            name: _name.value,
            email: _email.value,
            phone: _phone.value,
            address: _address.value,
            city: _city.value,
            state: _state.value,
            zipCode: _zipCode.value,
            age: _age.value,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Persona'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  errorText: _getErrorMessage(_name),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = RequiredText.dirty(value);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _getErrorMessage(_email),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = EmailInput.dirty(value);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  errorText: _getErrorMessage(_phone),
                ),
                onChanged: (value) {
                  setState(() {
                    _phone = PhoneInput.dirty(value);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  errorText: _getErrorMessage(_address),
                ),
                onChanged: (value) {
                  setState(() {
                    _address = RequiredText.dirty(value);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ciudad',
                  errorText: _getErrorMessage(_city),
                ),
                onChanged: (value) {
                  setState(() {
                    _city = RequiredText.dirty(value);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Estado',
                  errorText: _getErrorMessage(_state),
                ),
                onChanged: (value) {
                  setState(() {
                    _state = RequiredText.dirty(value);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Código Postal',
                  errorText: _getErrorMessage(_zipCode),
                ),
                onChanged: (value) {
                  setState(() {
                    _zipCode = RequiredText.dirty(value);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Edad',
                  errorText: _getErrorMessage(_age),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _age = AgeInput.dirty(value);
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}