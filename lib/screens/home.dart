import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Conectou mizeravi!",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Tost",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text("Teste Toast"))
            ],
          ),
        ),
      ),
    );
  }
}
