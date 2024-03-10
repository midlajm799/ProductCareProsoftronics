import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/notification_model.dart';
import 'package:hardware_pro/Model/register_complaint_model.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/ScreenHome.dart';
import 'package:hardware_pro/view/complaint/screen_reg_complaints.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegNewComplaint extends StatelessWidget {
  RegNewComplaint({super.key});
  // final proName = TextEditingController();
  TextEditingController proId = TextEditingController();
  final orderId = TextEditingController();
  TextEditingController purchaseDate = TextEditingController();
  final contactNumber = TextEditingController();
  final complaint = TextEditingController();
  final description = TextEditingController();

  String productName = "";
// String productId="";
  final _formkey = GlobalKey<FormState>();
  String time = DateFormat('h:mm a').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Consumer<FirestoreDatabase>(builder: (context, firestoree, chuld) {
          return FutureBuilder(
              future: firestoree.fetchCompletedProductsNameAndOrderId(),
              builder: (context, snapshot) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 235, 232, 232),
                              ),
                              color: const Color.fromARGB(255, 245, 241, 241),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          // width: 460,
                          // height: 460,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios,
                                          size: 27,
                                        )),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "NEW COMPLAINT",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 39, 43, 72),
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Product Name:",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 39, 43, 72)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField(
                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return "required field";
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(14)),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Product Name",
                                          hintStyle: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 93, 92, 92)),
                                          border: OutlineInputBorder()),

                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return "required field";
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      items: firestoree.listOfBroughtProduct
                                          .map((e) {
                                        productName = e["productName"];
                                        // proId.text = e["productId"];
                                        print(e["productId"]);

                                        return DropdownMenuItem(
                                            value: e.values,
                                            child: Text(
                                              e["productName"],
                                              style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 93, 92, 92)),
                                            ));
                                      }).toList(),
                                      onChanged: (value) {
                                        proId.text = value!.elementAt(2);

                                        String first = value.first;
                                        String last = value.last;
                                        orderId.text =
                                            first.substring(first.length - 8);
                                        purchaseDate.text =
                                            last.substring(0, 10);
                                      })
                                  // Container(
                                  //   height: 38,
                                  //   decoration: const BoxDecoration(color: Colors.white),
                                  //   child: const TextField(
                                  //     decoration: InputDecoration(
                                  //         hintText: "abc",
                                  //         hintStyle: TextStyle(
                                  //             fontSize: 19,
                                  //             fontWeight: FontWeight.bold,
                                  //             color: Color.fromARGB(255, 93, 92, 92)),
                                  //         border: OutlineInputBorder()),
                                  //   ),
                                  // ),
                                  ,
                                  const Text(
                                    "Product ID:",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 39, 43, 72)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "required field";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 93, 92, 92)),
                                    controller: proId,
                                    decoration:  InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(14)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "xxxx-xxxx-xxxx",
                                        hintStyle: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 93, 92, 92)),
                                        border: OutlineInputBorder()),
                                  ),
                                  const Text(
                                    "Order Number",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 39, 43, 72)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "required field";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 93, 92, 92)),
                                    controller: orderId,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(14)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "order id",
                                        hintStyle: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 93, 92, 92)),
                                        border: OutlineInputBorder(
                                          
                                        )),
                                  ),
                                  const Text(
                                    "Purchase Date",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 39, 43, 72)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "required field";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 93, 92, 92)),
                                    controller: purchaseDate,
                                    decoration:InputDecoration(enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(14)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "yyyy-mm-dd",
                                        hintStyle: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 93, 92, 92)),
                                        border: OutlineInputBorder()),
                                  ),
                                  const Text(
                                    "Contact Number:",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 39, 43, 72)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
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
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 93, 92, 92)),
                                    controller: contactNumber,
                                    maxLength: 10,
                                    keyboardType: TextInputType.phone,
                                    decoration:InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(14)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "xxxxxxxxxx",
                                        hintStyle: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 93, 92, 92)),
                                        border: OutlineInputBorder()),
                                  ),
                                  const Text(
                                    "Complaint:",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 39, 43, 72)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "required field";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 93, 92, 92)),
                                    controller: complaint,
                                    decoration:InputDecoration(enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(14)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "your complaints",
                                        hintStyle: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 93, 92, 92)),
                                        border: OutlineInputBorder()),
                                  ),
                                  const Text(
                                    "Describe Your Issue:",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 39, 43, 72)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "required field";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 93, 92, 92)),
                                    controller: description,
                                    decoration:InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(14)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText:
                                            "complaint description",
                                        hintMaxLines: 5,
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 93, 92, 92)),
                                        border: OutlineInputBorder()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor:
                                      const Color.fromARGB(255, 240, 144, 0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  final now = DateTime.now().toString();
                                  String complaintDate = now.substring(0, 10);

                                  firestoree
                                      .registerNewComplaint(
                                          RegisterComplaintModel(
                                              complaint: complaint.text,
                                              complaintDate: complaintDate,
                                              complaintStatus: "REGISTERED",
                                              description: description.text,
                                              orderDate: purchaseDate.text,
                                              orderId: orderId.text,
                                              productId: proId.text,
                                              productName: productName,
                                              contactNumber: contactNumber.text,
                                              uid: FirebaseAuth
                                                  .instance.currentUser!.uid),
                                          date,
                                          time)
                                      .then((value) {
                                    showSuccessMessage(
                                        context, "Your Complaint is registerd");
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => MainPage(),
                                        ),
                                        (route) => false);
                                  });
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return const ScreenRegComplaints();
                                  //   },
                                  // ));
                                }
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
