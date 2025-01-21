import 'package:flutter/material.dart';
import 'package:flutter_application_form/utils/validators.dart';
import '../widgets/custom_text_form_field.dart';
import '../validators/email.dart';
import '../validators/password.dart';
import '../validators/confirm_password.dart';
import '../validators/required_text.dart';
import '../validators/name.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Name _name = const Name.pure();
  Email _email = const Email.pure();
  Password _password = const Password.pure();
  ConfirmPassword _confirmPassword = const ConfirmPassword.pure();
  RequiredText _city = const RequiredText.pure();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulario enviado con éxito')),
      );

      _formKey.currentState!.reset();
      _nameController.clear();
      _emailController.clear();
      _cityController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();

      setState(() {
        _name = const Name.pure();
        _email = const Email.pure();
        _password = const Password.pure();
        _confirmPassword = const ConfirmPassword.pure();
        _city = const RequiredText.pure();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, corrige los errores en el formulario')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  labelText: 'Nombre',
                  hintText: 'Introduce tu nombre',
                  prefixIcon: Icons.person,
                  controller: _nameController,
                  validator: (value) => _name.errorMessage,
                  onChanged: (value) {
                    setState(() {
                      _name = Name.dirty(value);
                    });
                  },
                ),
                SizedBox(height: 16),

                CustomTextFormField(
                  labelText: 'Email',
                  hintText: 'Introduce tu email',
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  validator: (value) => _email.errorMessage,
                  onChanged: (value) {
                    setState(() {
                      _email = Email.dirty(value);
                    });
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Ciudad',
                  hintText: 'Introduce tu ciudad',
                  prefixIcon: Icons.location_city,
                  controller: _cityController,
                  validator: (value) => _city.errorMessage,
                  onChanged: (value) {
                    setState(() {
                      _city = RequiredText.dirty(value);
                    });
                  },
                ),
                SizedBox(height: 16),

                CustomTextFormField(
                  labelText: 'Contraseña',
                  hintText: 'Introduce tu contraseña',
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  onSuffixIconPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: (value) => _password.errorMessage,
                  onChanged: (value) {
                    setState(() {
                      _password = Password.dirty(value);
                      _confirmPassword = ConfirmPassword.dirty(
                        password: _password.value,
                        value: _confirmPassword.value,
                      );
                    });
                  },
                ),
                SizedBox(height: 16),

                CustomTextFormField(
                  labelText: 'Confirmar Contraseña',
                  hintText: 'Confirma tu contraseña',
                  prefixIcon: Icons.lock,
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                  onSuffixIconPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  validator: (value) => _confirmPassword.errorMessage,
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = ConfirmPassword.dirty(
                        password: _password.value,
                        value: value,
                      );
                    });
                  },
                ),
                SizedBox(height: 32),

                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Registrarme'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}