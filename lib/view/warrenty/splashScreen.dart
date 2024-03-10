import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hardware_pro/view/ScreenHome.dart';
import 'package:hardware_pro/view/sign/lets_go.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String product = "lib/assets/product.jpeg";
    Future.delayed(const Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LetsGo()),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainPage()),
            (route) => false);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox(),
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
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
