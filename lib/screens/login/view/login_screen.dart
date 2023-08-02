import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_transactions/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transactions_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  final _snackBar = SnackBar(
    content: const Text('Ошибка'),
    action: SnackBarAction(
      textColor: Colors.green,
      label: 'Закрыть',
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessfulState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Transactions',
              style: TextStyle(
                fontSize: 45,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TransactionsTextField(
              controller: _email,
              hintText: 'Email',
              bottom: 14,
            ),
            TransactionsTextField(
              controller: _password,
              hintText: 'Пароль',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginInitEvent(_email.text, _password.text),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const SizedBox(
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Войти',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
