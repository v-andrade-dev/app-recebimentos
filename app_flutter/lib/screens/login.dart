import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Senha"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
