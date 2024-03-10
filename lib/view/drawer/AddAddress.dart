import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/addressModel.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:provider/provider.dart';

class ScreenAddAddress extends StatelessWidget {
  ScreenAddAddress({super.key});
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final address = TextEditingController();
  final flatnumber = TextEditingController();
  final city = TextEditingController();
  final pincode = TextEditingController();
  final area = TextEditingController();
  final state = TextEditingController();
  final landmark = TextEditingController();
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    String adress = "lib/assets/addaddress.jpeg";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )),
                    const Text(
                      "Back",
                      style: TextStyle(
                          color: Color.fromARGB(255, 58, 58, 60),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  const Positioned(
                    right: 13,
                    top: 40,
                    child: Icon(
                      Icons.location_on,
                      shadows: [Shadow(blurRadius: 10, color: Colors.grey)],
                      size: 700,
                      color: Color.fromARGB(255, 229, 228, 228),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 130,
                            right: 130,
                          ),
                          child: Image.asset(adress),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 120,
                          ),
                          child: Text(
                            "Add Address",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: height * .53,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 55, right: 55),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Name",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: address,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Address",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: flatnumber,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Flat/House no.",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: city,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "City",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: pincode,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Pincode",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: area,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Area/street",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: state,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "State",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: landmark,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Landmark",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  TextFormField(
                                    controller: phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field is required";
                                      }
                                      if (value.length < 10) {
                                        return "number is incorrect";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 228, 225, 225),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Phone",
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 120,
                          height: 38,
                          child: Consumer<FirestoreDatabase>(
                            builder: (context,instence,child ){
                              return OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 27, 39, 120),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20))),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // int pin = int.parse(pincode.text);
                                      // int number = int.parse(phone.text);
                                      instence.addNewAddress(UserAddressModel(
                                          name: name.text,
                                          address: address.text,
                                          houseNo: flatnumber.text,
                                          city: city.text,
                                          pincode: pincode.text,
                                          area: area.text,
                                          state: state.text,
                                          landmark: landmark.text,
                                          phoneNumber: phone.text));
                                      showSuccessMessage(
                                          context, "adress added successfully");
                                      Navigator.of(context).pop(true);
                                    }
                                  },
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ));
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
