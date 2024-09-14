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
        body: Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 146, 247, 155)),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/icon.png",
                  height: 50,
                ),
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
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Entrar"),
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
