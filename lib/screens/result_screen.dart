import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String age;

  const ResultScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Ingresados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: $name', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Email: $email', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Teléfono: $phone', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Dirección: $address', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Ciudad: $city', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Estado: $state', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Código Postal: $zipCode', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Edad: $age', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}