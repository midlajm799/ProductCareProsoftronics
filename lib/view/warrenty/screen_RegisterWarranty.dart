import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hardware_pro/Model/warrenty_model.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/warrenty/success_reg_warre.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ScreenRegWarranty extends StatelessWidget {
  ScreenRegWarranty({super.key});
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  // final product = TextEditingController();
  final ordernumber = TextEditingController();
  final serailnumber = TextEditingController();
  final purchasedate = TextEditingController();
  Map<String, dynamic> selectedproductData = {};
  String date = "";
  String orderId = "";
  String profuctName = "";
  String productId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FirestoreDatabase>(builder: (context, firestore, child) {
        return FutureBuilder(
            future: firestore.fetchCompletedProductsNameAndOrderId(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                  child: Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 235, 232, 232),
                        ),
                        color: const Color.fromARGB(255, 244, 241, 241),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40))),
                    width: 450,
                    height: 150,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 30,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.orange[700],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 210,
                          ),
                          child: Text(
                            "Warranty",
                            style: TextStyle(
                                color: Colors.orange[700],
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 220),
                    child: Text(
                      "Full Name:",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required field";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "name",
                          hintStyle: const TextStyle(fontSize: 19),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 260),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required field";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "abc@example.com",
                          hintStyle: const TextStyle(fontSize: 19),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 180),
                    child: Text(
                      "Mobile Number",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: mobile,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        if (value.length != 10) {
                          return 'Mobile number must be 10 digits';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter valid  mobile number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "phone",
                          hintStyle: const TextStyle(fontSize: 19),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 140),
                    child: Text(
                      "Choose Your Product",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            hintText: "Product Name",
                            hintStyle: const TextStyle(fontSize: 19),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),

                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "required field";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        items: firestore.listOfBroughtProduct.map((e) {
                          profuctName = e["productName"];
                          productId = e["productId"];

                          return DropdownMenuItem(
                            value: e.values,
                            child: Text(e["productName"]),
                          );
                        }).toList(),
                        onChanged: (value) {
                          String first = value!.first;
                          String last = value.last;
                          orderId = first.substring(first.length - 8);
                          date = last.substring(0, 10);

                          print(orderId);
                          print(date);
                        }),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 40, right: 40),
                  //   child: TextFormField(
                  //     controller: product,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "required field";
                  //       } else {
                  //         return null;
                  //       }
                  //     },
                  //     decoration: InputDecoration(
                  //         hintText: "Product Name",
                  //         hintStyle: const TextStyle(fontSize: 19),
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10))),
                  //   ),
                  // ),
                  ,
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 180),
                    child: Text(
                      "Order Number",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: ordernumber,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required field";
                        } else if (value != orderId) {
                          return "id is incorrect";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "s6ty-8hfvs-shha",
                          hintStyle: const TextStyle(fontSize: 19),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 180),
                    child: Text(
                      "Serial Number",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: serailnumber,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required field";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "0000 0000 0000",
                          hintStyle: const TextStyle(fontSize: 19),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 180),
                    child: Text(
                      "Purchased Date",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: purchasedate,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required field";
                        } else if (value != date) {
                          return "the date is not correct";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "yyyy-mm-dd",
                          hintStyle: const TextStyle(fontSize: 19),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor:
                                const Color.fromARGB(255, 55, 64, 109)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showLoadingIndicator(context, "Processing...");
                            firestore
                                .registerNewWarrenty(RegisterWarrentyModel(
                                    claimStatus: "NOT",
                                    warrentyStatus: "PENDING",
                                    email: email.text,
                                    productid: productId,
                                    uid: FirebaseAuth.instance.currentUser!.uid,
                                    name: profuctName,
                                    orderId: orderId,
                                    phoneNumber: int.parse(mobile.text),
                                    product: profuctName,
                                    purchaseDate: purchasedate.text,
                                    srialnumber: serailnumber.text))
                                .then((value) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    SuccessfulRegistrationWarrenty(),
                              ));
                            });
                          }
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ]),
              ));
            });
      }),
    );
  }
}
