import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hardware_pro/view/sign/signin.dart';

class LetsGo extends StatelessWidget {
  const LetsGo({super.key});

  @override
  Widget build(BuildContext context) {
    String product = "lib/assets/product.jpeg";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Image.asset(
              product,
              scale: 4,
            ),
          ),
          Stack(
            children: [
              Text(
                "PRODUCT",
                style: GoogleFonts.kanit(
                    color: const Color.fromARGB(64, 63, 69, 104),
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.8.h),
                child: Text(
                  "PRODUCT",
                  style: GoogleFonts.kanit(
                      color: const Color.fromARGB(64, 63, 69, 104),
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  "PRODUCT",
                  style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 63, 69, 104),
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Text(
                  "CARE PRO",
                  style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 63, 69, 104),
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Text(
            """Stay Covered,Stay Connected
                   With us.""",
            style: GoogleFonts.kanit(fontSize: 17, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 2.h,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: const Color.fromARGB(255, 255, 153, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return  ScreenSignIn();
                  },
                ));
              },
              child: Text(
                "Let's Go!",
                style: GoogleFonts.kanit(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
