import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Ruben',
      'last_name': 'Schlaen',
      'email': 'rgschlaen@google.com',
      'password': '12345',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Inputs y Forms')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //El form debe envolver al widget que engloba a todos los fields
          child: Form(
            // El estado del formulario pasa a estar guardado en myFormKey
            key: myFormKey,
            child: Column(children: [
              CustomInputField(
                  labelText: 'Nombre', hintText: 'Nombre del usuario', formProperty: 'first_name', formValues: formValues),
              const SizedBox(height: 30),
              CustomInputField(
                  labelText: 'Apellido', hintText: 'Apellido del usuario', formProperty: 'last_name', formValues: formValues),
              const SizedBox(height: 30),
              CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues),
              const SizedBox(height: 30),
              CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                  DropdownMenuItem(value: 'Superuser', child: Text('Superuser')),
                  DropdownMenuItem(value: 'Developer', child: Text('Developer')),
                  DropdownMenuItem(value: 'Jr. Developer', child: Text('Jr. Developer')),
                ],
                onChanged: (value) {
                  formValues['role'] = value ?? 'Admin';
                },
              ),
              ElevatedButton(
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Guardar')),
                ),
                onPressed: () {
                  // Para sacar el teclado al hacer click en el boton
                  // FocusScope.of(context).unfocus();
                  if (!myFormKey.currentState!.validate()) {
                    print('formulario no valido');
                  }
                  print(formValues);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
