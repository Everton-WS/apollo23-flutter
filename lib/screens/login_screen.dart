// ignore_for_file: use_build_context_synchronously

import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/repositories/user_repository.dart';
import 'package:apollo23_app/screens/home_screen.dart';
import 'package:apollo23_app/widgets/user_logged_inherited.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = TextEditingController(text: 'user@apollo23.com');
    final senhaController = TextEditingController(text: '1234');
    final formKey = GlobalKey<FormState>();
    bool isTryingToLog = false;

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
                    const Text(
                      'e-venture',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(blurRadius: 7, color: Colors.grey, offset: Offset(5, 5))]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                        onPressed: isTryingToLog
                            ? null
                            : () async {
                                isTryingToLog = true;
                                String msg = '';
                                if (usuarioController.text == 'user@apollo23.com' && senhaController.text == '1234') {
                                  try {
                                    UserModel? user = await UserRepository.login(usuarioController.text);
                                    if (user != null) {
                                      UserLoggedWidget.of(context).setUserLogged = user;
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => HomeScreen(userModel: user),
                                      ));
                                      return;
                                    }
                                  } catch (error) {
                                    msg = error.toString();
                                  }
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                        msg,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                      backgroundColor: Colors.red),
                                );
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
