import 'package:app_flutter/resource/app_colors.dart';
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
      decoration: const BoxDecoration(color: AppColors.primary),
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
                    decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: AppColors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black))),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: AppColors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black))),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(color: AppColors.neutral),
                    ),
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
