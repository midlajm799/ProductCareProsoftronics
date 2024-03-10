import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hardware_pro/view/shop/screen_shop.dart';

class ScreenOrderSucsessfull extends StatelessWidget {
  const ScreenOrderSucsessfull({super.key});

  @override
  Widget build(BuildContext context) {
    String bluetick = "lib/assets/BLUE.webp";
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                const Expanded(flex: 2, child: SizedBox()),
                SizedBox(
                  height: 200,
                  width: 700,
                  child: Image(
                      image: AssetImage(
                    bluetick,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "DONE!",
                  style: GoogleFonts.ubuntu(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const Expanded(flex: 2, child: SizedBox()),
                SizedBox(
                  width: 150,
                  height: 42,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 153, 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ScreenShop(),
                        ));
                      },
                      child: const Text(
                        "SHOP",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            )));
  }
}
