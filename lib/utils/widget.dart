import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.deepOrange,
    ),
  );
}

customeSuccesfulShowDiolog(String title, BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      content: Text(
        title,
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    ),
  );
}

showLoadingIndicator(context, String noti) {
  return showDialog(
    barrierDismissible: false,
    useSafeArea: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 30,
              ),
              Text(noti)
            ],
          ),
        ),
      );
    },
  );
}

showSuccessMessage(context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(message),
    backgroundColor: const Color.fromARGB(255, 0, 169, 6),
  ));
}

showErrorMessage(context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(message),
    backgroundColor: Color.fromARGB(255, 169, 0, 0),
  ));
}
