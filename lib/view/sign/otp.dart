import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hardware_pro/Model/addressModel.dart';
import 'package:hardware_pro/Model/user_model.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/view/sign/signin.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  String name;
  String email;
  String password;
  String phone;
  OtpScreen(
      {super.key,
      required this.email,
      required this.name,
      required this.password,
      required this.phone});
  final _formState = GlobalKey<FormState>();
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(child: Image.asset("lib/assets/otp.png")),
              Text(
                "OTP Verification",
                style: TextStyle(
                    color: const Color.fromARGB(255, 63, 69, 104),
                    fontSize: 27.dp,
                    fontWeight: FontWeight.w500),
              ),
              Divider(
                indent: 30.w,
                endIndent: 30.w,
                thickness: 2,
                color: const Color.fromARGB(110, 100, 100, 100),
              ),
              const Text("""Enter the verification code that
              we just send you!"""),
              SizedBox(
                height: 5.h,
              ),
              Pinput(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter otp";
                  } else {
                    return null;
                  }
                },
                controller: otpController,
                defaultPinTheme: PinTheme(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          width: 3,
                          style: BorderStyle.solid,
                          color: const Color.fromARGB(255, 63, 69, 104),
                        )
                        // border: Border.all(),
                        )),
                // preFilledWidget: SizedBox(
                //   height: 4.5.h,
                //   width: 10.w,
                // ),
                // border: Border.all(),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 5.h,
                width: 30.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
                    onPressed: () {
                      
                      if (_formState.currentState!.validate()) {
                        auth.verifyOtp(
                            otpController.text,
                            email,
                            password,
                            context,
                            UserModel(
                              email: email,
                              image: "",
                             
                              userName: name,
                            ));
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //         builder: (context) => ScreenSignIn()),
                        //     (route) => false);
                      }
                    },
                    child: Text(
                      "Submit",
                      style: GoogleFonts.kanit(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              Text(
                "Resend OTP",
                style: GoogleFonts.kanit(
                    fontSize: 14.dp,
                    color: const Color.fromARGB(255, 113, 113, 113)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
