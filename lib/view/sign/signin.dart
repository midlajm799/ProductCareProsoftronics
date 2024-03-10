// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hardware_pro/View%20Model/controller.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/view/sign/signup.dart';
import 'package:hardware_pro/view/ScreenHome.dart';
import 'package:provider/provider.dart';

class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    String signIn = "lib/assets/signIn.jpeg";
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Image.asset(
                signIn,
                scale: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The field is required";
                          } else if (!(value.contains("@gmail.com"))) {
                            return "Email is not valid";
                          } else {
                            return null;
                          }
                        },
                        /////validator:
                        //////  if (_emailRegExp.hasMatch(_EmailController.text)) {
                        //////     },
                        controller: emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 239, 237, 237),

                            //

                            hintText: "Email",
                            hintStyle: const TextStyle(
                                fontSize: 19,
                                color: Color.fromARGB(255, 92, 90, 90),
                                fontWeight: FontWeight.w900),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<Controller>(builder: (context, controller, child) {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "The field is required";
                            } else if (value.length < 6) {
                              return "Password must contain 6 digit";
                            } else {
                              return null;
                            }
                          },
                          obscureText: controller.isObsecure,
                          controller: passwordController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.showpassword();
                                  },
                                  icon: controller.isObsecure
                                      ? const Icon(
                                          CupertinoIcons.eye_slash_fill)
                                      : const Icon(CupertinoIcons.eye_solid)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 239, 237, 237),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 92, 90, 90),
                                  fontWeight: FontWeight.w900),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))));
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "forgot password?",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 5.h,
                      width: 30.w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            backgroundColor:
                                const Color.fromARGB(255, 23, 28, 61),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              auth.login(emailController.text,
                                  passwordController.text, context,const MainPage());
                              //   Navigator.of(context).pushAndRemoveUntil(
                              //       MaterialPageRoute(
                              //           builder: (context) => const MainPage()),
                              //       (route) => false);
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.kanit(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "not have an account?",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScreenSignUp()));
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 255, 153, 0),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
