import 'package:flutter/material.dart';

class AppConfimationDialog {
  static Future<bool> runTaskSucessOrError(
    BuildContext context,
    Future<bool> Function() callback,
  ) async {
    bool success;
    String message;

    try {
      success = await callback();
      message = success
          ? 'Operação realizada com sucesso!'
          : 'A operação falhou. Tente novamente.';
    } catch (e) {
      success = false;
      message = 'Ocorreu um erro: $e';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(success ? 'Sucesso' : 'Erro'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return success;
  }
}
