import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hardware_pro/View%20Model/controller.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/view/sign/otp.dart';
import 'package:hardware_pro/view/sign/signin.dart';
import 'package:provider/provider.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String Login = "lib/assets/LoginAss.jpeg";
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              Login,
              scale: 3.5,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 239, 237, 237),
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(255, 92, 90, 90),
                              fontWeight: FontWeight.w900),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The field is required";
                        } else if (!(value.contains("@gmail.com"))) {
                          return "Email is not valid";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 239, 237, 237),
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(255, 92, 90, 90),
                              fontWeight: FontWeight.w900),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The field is required";
                        } else if (value.length > 10 || value.length < 10) {
                          return "Number is not valid";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 239, 237, 237),
                          hintText: "Phone",
                          hintStyle: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(255, 92, 90, 90),
                              fontWeight: FontWeight.w900),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer<Controller>(builder: (context, controller, child) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: controller.isObsecure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The field is required";
                          } else if (value.length < 6) {
                            return "Password must contain 6 digit";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.showpassword();
                                },
                                icon: controller.isObsecure
                                    ? const Icon(CupertinoIcons.eye_slash_fill)
                                    : const Icon(CupertinoIcons.eye_solid)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 239, 237, 237),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                fontSize: 19,
                                color: Color.fromARGB(255, 92, 90, 90),
                                fontWeight: FontWeight.w900),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      );
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 5.h,
              width: 30.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: const Color.fromARGB(255, 91, 223, 159)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      auth.configureEmail(emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Otp send to ${emailController.text}")));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OtpScreen(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                name: nameController.text.trim(),
                                phone: phoneController.text.trim(),
                              )));
                    }
                  },
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.kanit(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "already have an account?",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => ScreenSignIn()),
                          (route) => false);
                    },
                    child: Text("Sign in",
                        style: GoogleFonts.davidLibre(
                          fontSize: 18,
                          color: Colors.amber,
                        )))
              ],
            )
          ],
        ),
      )),
    );
  }
}
