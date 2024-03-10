import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/notification_model.dart';
import 'package:hardware_pro/Model/warrenty_model.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/colors.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/ScreenHome.dart';
import 'package:hardware_pro/view/warrenty/claim_warrenty_request_submited.dart';
import 'package:hardware_pro/view/warrenty/screen_RegisterWarranty.dart';
import 'package:hardware_pro/view/warrenty/viewRegisterdWarrenty.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ClaimWarrenty extends StatelessWidget {
  RegisterWarrentyModel registerWarrentyModel;
  ClaimWarrenty({super.key, required this.registerWarrentyModel});
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  String time = DateFormat('h:mm a').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FirestoreDatabase>(context);
    return Scaffold(
      body: Column(
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
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    )),
                const Text(
                  "Claim warranty",
                  style: TextStyle(
                      color: Color.fromARGB(255, 76, 83, 126),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)),
            // height: 115,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product name : ${registerWarrentyModel.name.toUpperCase()}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 76, 83, 126),
                    ),
                  ),
                  Text(
                    "Order no: ${registerWarrentyModel.orderId} ",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 76, 83, 126),
                    ),
                  ),
                  Text(
                    "Serial no:  ${registerWarrentyModel.srialnumber}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 76, 83, 126),
                    ),
                  ),
                  Text(
                    "Warranty no:  ${registerWarrentyModel.warrentyId}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 76, 83, 126),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          registerWarrentyModel.claimStatus != "NOT"
              ? Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: claimStatusColor(
                              registerWarrentyModel.claimStatus))),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              if (registerWarrentyModel.claimStatus ==
                                  "CANCELED") {
                                return const AlertDialog(
                                  content: Text(
                                      "This warrenty is canceled your self, not possible to re-request."),
                                );
                              } else if (registerWarrentyModel.claimStatus ==
                                  "REQUESTED") {
                                return const AlertDialog(
                                  content: Text(
                                      "Please wait for our confirmation,your request for claiming warrenty is under process"),
                                );
                              } else if (registerWarrentyModel.claimStatus ==
                                  "CLAIMED") {
                                return const AlertDialog(
                                  content: Text("Succesfully claimed"),
                                );
                              } else if (registerWarrentyModel.claimStatus ==
                                  "ONGOING") {
                                return AlertDialog(
                                  content: const SizedBox(
                                    child: Text(
                                        "Your request for claim warrenty is reviewed our team.we will connect you soon\n\nIf our team is connected enter the code below and complete the claiming procedure."),
                                  ),
                                  actions: [
                                    Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: controller,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter the id before verify";
                                          } else if (value !=
                                              registerWarrentyModel.productid) {
                                            return "Check the id once again before verify";
                                          } else {
                                            return null;
                                          }
                                        },
                                        maxLines: 1,

                                        decoration: InputDecoration(
                                            suffixIcon: TextButton(
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    // Navigator.of(context).pop();
                                                    showLoadingIndicator(
                                                        context, "Please wait");
                                                    Future.delayed(
                                                            const Duration(
                                                                seconds: 3))
                                                        .then((value) async {
                                                      await provider
                                                          .updateClaimStatus(
                                                              registerWarrentyModel
                                                                  .warrentyId,
                                                              "CLAIMED",
                                                              NotificationModel(
                                                                  notification:
                                                                      "(Warrenty Id :${registerWarrentyModel.warrentyId})\nWarrenty is claimed",
                                                                  date: date,
                                                                  time: time))
                                                          .then((value) {
                                                        showSuccessMessage(
                                                            context,
                                                            "Warrenty claimed");

                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ViewRegisterdWarrenty(),
                                                      ));
                                                    });
                                                  }
                                                },
                                                child: const Text("Verify")),
                                            hintText:
                                                "Enter the given confirmation id here",
                                            border: const OutlineInputBorder()),
                                        // decoration: InputDecoration(),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return const SizedBox();
                              }
                            });
                      },
                      child: Text(
                        registerWarrentyModel.claimStatus,
                        style: TextStyle(
                            color: claimStatusColor(
                                registerWarrentyModel.claimStatus),
                            fontSize: 20),
                      )),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black)),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text(
                                      "Are you sure about claim warrenty..?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("No",
                                            style: TextStyle(
                                                color: Colors.black))),
                                    TextButton(
                                        onPressed: () {
                                          firestore.updateClaimStatus(
                                              registerWarrentyModel.warrentyId,
                                              "REQUESTED",
                                              NotificationModel(
                                                  notification:
                                                      "(Warrenty Id :${registerWarrentyModel.warrentyId})\nRequest for claiming warrenty is send to Hub",
                                                  date: date,
                                                  time: time));
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenRequestSub(),
                                          ));
                                        },
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.green),
                                        ))
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Claim",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black)),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text(
                                      "Are you sure about Cancel warrenty..?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("No",
                                            style: TextStyle(
                                                color: Colors.black))),
                                    TextButton(
                                        onPressed: () {
                                          firestore.updateClaimStatus(
                                              registerWarrentyModel.warrentyId,
                                              "CANCELED",
                                              NotificationModel(
                                                  notification:
                                                      "(Warrenty Id :${registerWarrentyModel.warrentyId})\nWarrenty is canceled by your self",
                                                  date: date,
                                                  time: time));
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewRegisterdWarrenty(),
                                          ));
                                        },
                                        child: const Text("Yes",
                                            style:
                                                TextStyle(color: Colors.red)))
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ],
                ),
          const Expanded(
            child: SizedBox(
              height: 200,
            ),
          ),
          SizedBox(
            width: 310,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 42, 46, 69),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                      (route) => false);
                },
                child: const Text(
                  "Home",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
