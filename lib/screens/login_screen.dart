import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/repositories/user_repository.dart';
import 'package:apollo23_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = UserRepository.login('user');

    final usuarioController = TextEditingController(text: user.email);
    final senhaController = TextEditingController(text: user.password);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SizedBox(
                width: constraints.maxWidth * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      key: const ValueKey('form_input_usuario'),
                      controller: usuarioController,
                      decoration: const InputDecoration(labelText: 'Usuário'),
                      validator: (value) {
                        if (value.toString().trim().isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: const ValueKey('form_input_senha'),
                      controller: senhaController,
                      decoration: const InputDecoration(labelText: 'Senha'),
                      obscureText: true,
                      validator: (value) {
                        if (value.toString().trim().isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (usuarioController.text.trim() == user.email &&
                                senhaController.text.trim() == user.password) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                      'Usuário/Senha inválido',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.red),
                              );
                            }
                          }
                        },
                        child: const Text('Login'))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
