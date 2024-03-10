import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hardware_pro/view/ScreenHome.dart';

class ScreenRequestSub extends StatelessWidget {
  const ScreenRequestSub({super.key});

  @override
  Widget build(BuildContext context) {
    String tick = "lib/assets/tick.jpeg";
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 235, 232, 232),
                ),
                color: const Color.fromARGB(255, 244, 241, 241),
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            width: 450,
            height: 150,
            child: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_back_ios_new_sharp),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 100),
                      child: Text(
                        "Home",
                        style: TextStyle(
                            color: Color.fromARGB(255, 61, 69, 109),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 120, right: 120),
            child: Image.asset(tick),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Requested submitted!",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "We will contact you shortly.",
            style: TextStyle(
                color: Color.fromARGB(255, 55, 54, 54),
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 90,
          ),
          SizedBox(
            width: 299,
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    backgroundColor: const Color.fromARGB(255, 47, 46, 46)),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                      (route) => false);
                },
                child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          )
        ],
      )),
    );
  }
}
